class Tqrdc::ReportsController < ApplicationController
  before_action :order_detail, only: [:show]
  def order_summary
    @orders, @groups = Tqrdc::Report.order_summary(params)
  end

  def show
    @order = Tqrdc::Order.where(:seq => '5')
                 .eager_load(:order_groups, :order_lines)
                 .find params[:id]
  end

  def order_detail
    @qheads = {}
    Tqrdc::Qhead.all.each do |qhead|
      @qheads[qhead.id] = qhead
    end

    @groups = {}
    Tqrdc::Group.all.each do |group|
      @groups[group.id] = group
    end

    @qlines = {}
    Tqrdc::Qline.find_by_sql('select * from tqrdc_qline order by id').each do |qline|
      array = @qlines[qline.qhead_id] || []
      array.append qline
      @qlines[qline.qhead_id] = array
    end

    sql = "
      select distinct '4' as utype,username,u.id from tqrdc_order_line a join users u on u.id = a.u4_user_id where a.order_id = #{params[:id]}    "
    @u4_users = []
    @users = {}
    Tqrdc::Order.find_by_sql(sql).each do |row|
      @u4_users.append row.username if row.utype == '4'
      @users[row.id] = row.username
    end
  end

end
