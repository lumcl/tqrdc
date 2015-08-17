class Tqrdc::ScoresController < ApplicationController
  before_action :set_tqrdc_order, only: [:show, :edit]

  def index
    #order.status != close
    #order_line.status != close
    #order_line.uXuser_id == current_user_id

    supplier = params[:supplier] || ''
    period = params[:period] || ''
    territory = params[:territory] || ''

    sql = "
      select x.id,x.period,x.territory,x.status,x.lifnr,x.vname,x.mtype,x.total,x.username,x.seq,
        case
          when x.seq = 1 then (select count(*) from tqrdc_order_line u1 where u1.order_id = x.id and u1.u1_user_id = #{current_user.id} and u1.seq = x.seq)
          when x.seq = 2 then (select count(*) from tqrdc_order_line u2 where u2.order_id = x.id and u2.u2_user_id = #{current_user.id} and u2.seq = x.seq)
          when x.seq = 3 then (select count(*) from tqrdc_order_line u3 where u3.order_id = x.id and u3.u3_user_id = #{current_user.id} and u3.seq = x.seq)
          when x.seq = 4 then (select count(*) from tqrdc_order_line u4 where u4.order_id = x.id and u4.u4_user_id = #{current_user.id} and u4.seq = x.seq)
        end question,
        case
          when x.seq = 1 then (select count(*) from tqrdc_order_line u1 where u1.order_id = x.id and u1.u1_user_id = #{current_user.id} and u1.u1_qline_id is null and u1.seq = x.seq)
          when x.seq = 2 then (select count(*) from tqrdc_order_line u2 where u2.order_id = x.id and u2.u2_user_id = #{current_user.id} and u2.u2_qline_id is null and u2.seq = x.seq)
          when x.seq = 3 then (select count(*) from tqrdc_order_line u3 where u3.order_id = x.id and u3.u3_user_id = #{current_user.id} and u3.u3_qline_id is null and u3.seq = x.seq)
          when x.seq = 4 then (select count(*) from tqrdc_order_line u4 where u4.order_id = x.id and u4.u4_user_id = #{current_user.id} and u4.u4_qline_id is null and u4.seq = x.seq)
        end no_answer
      from (
          select distinct a.id,a.period,a.territory,a.status,b.supplier lifnr,b.vname,b.mtype,a.total,u.username,a.seq
          from tqrdc_order a
            join tqrdc_supplier b on b.id = a.supplier_id and b.supplier like '%#{supplier}%'
            join users u on u.id = b.commodity_mgr_id
            join tqrdc_order_line c on c.order_id = a.id and c.status <> 'CLOSE' and
                 (c.u1_user_id = #{current_user.id} or c.u2_user_id = #{current_user.id} or c.u3_user_id = #{current_user.id} or c.u4_user_id =#{current_user.id})
          where a.status <> 'CLOSE' and a.period like '%#{period}%' and a.territory like '%#{territory}%'
          ) x
      order by period,territory,mtype,lifnr
    "
    orders = Tqrdc::Order.find_by_sql sql

    #paging
    @page = (params[:page] || 1).to_i
    @orders = Kaminari.paginate_array(orders).page(@page)

  end

  def edit
    user_selections = "
      ((tqrdc_order_line.u1_user_id = #{current_user.id}) or
       (tqrdc_order_line.u2_user_id = #{current_user.id}) or
       (tqrdc_order_line.u3_user_id = #{current_user.id}) or
       (tqrdc_order_line.u4_user_id = #{current_user.id}))
    "
    @order = Tqrdc::Order
                 .eager_load(:order_groups, :order_lines)
                 .where('tqrdc_order_group.id = tqrdc_order_line.order_group_id')
                 .where(user_selections)
                 .find params[:id]
  end

  def show
    @order = Tqrdc::Order
                 .eager_load(:order_groups, :order_lines)
                 .find params[:id]
  end

  def supplier_entry
    @order = Tqrdc::Order.includes(:order_groups, :order_lines)
                 .where(:supplier_id => current_user.supplier_id)
                 .where(:status => 'CREATE')
                 .last

    @order_groups = @order.order_groups
    @order_lines = @order.order_lines

    @qheads = Hash.new
    Tqrdc::Qhead.all.each do |qhead|
      @qheads[qhead.id] = qhead
    end

    @groups = Hash.new
    Tqrdc::Group.all.each do |group|
      @groups[group.id] = group
    end

  end

  def supplier_enquiry
    @orders = Tqrdc::Order.where(:supplier_id => current_user.supplier_id)

  end

  def update_scores
    order_id = Tqrdc::Order.update_scores(params, request.ip)
    redirect_to url_for(:action => :show, :id => order_id)
  end

  def submit
    order = Tqrdc::Order.find params[:id]
    Tqrdc::Order.transaction do
      Tqrdc::OrderLine
          .where(:order_id => order.id).where(:seq => order.seq).where("u#{order.seq}_user_id = #{current_user.id}")
          .update_all(:seq => order.seq + 1)

      count = Tqrdc::OrderLine.where(:order_id => order.id).where(:seq => order.seq).count
      if count == 0
        order.seq = order.seq + 1
        order.save
      end

    end
    redirect_to tqrdc_scores_path({:anchor => "order_#{order.id}"})
  end

  private

  def set_tqrdc_order
    @qheads = {}
    Tqrdc::Qhead.all.each do |qhead|
      @qheads[qhead.id] = qhead
    end

    @groups = {}
    Tqrdc::Group.all.each do |group|
      @groups[group.id] = group
    end

    @qlines = {}
    Tqrdc::Qline.all.each do |qline|
      @qheads[qline.id] = qline
    end

    sql = "
      select distinct '1' utype,username,u.id from tqrdc_order_line a join users u on u.id = a.u1_user_id where a.order_id = #{params[:id]}
      union
      select distinct '2',username,u.id from tqrdc_order_line a join users u on u.id = a.u2_user_id where a.order_id = #{params[:id]}
      union
      select distinct '3',username,u.id from tqrdc_order_line a join users u on u.id = a.u3_user_id where a.order_id = #{params[:id]}
      union
      select distinct '4',username,u.id from tqrdc_order_line a join users u on u.id = a.u4_user_id where a.order_id = #{params[:id]}
    "
    @u1_users = []
    @u2_users = []
    @u3_users = []
    @u4_users = []
    @users = {}
    Tqrdc::Order.find_by_sql(sql).each do |row|
      @u1_users.append row.username if row.utype == '1'
      @u2_users.append row.username if row.utype == '2'
      @u3_users.append row.username if row.utype == '3'
      @u4_users.append row.username if row.utype == '4'
      @users[row.id] = row.username
    end
  end

end
