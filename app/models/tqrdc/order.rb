class Tqrdc::Order < ActiveRecord::Base
  belongs_to :supplier, :class_name => 'Tqrdc::Supplier'
  has_many :order_groups, :class_name => 'Tqrdc::OrderGroup', :dependent => :destroy
  has_many :order_lines, :class_name => 'Tqrdc::OrderLine', :dependent => :destroy
  has_many :order_files, :class_name => 'Tqrdc::OrderFile', :dependent => :destroy


  validates_uniqueness_of :supplier_id, :scope => [:period]


  def self.update_scores(params, ip)
    #rd_u1_#{order_line.id}
    #cm_u1_#{order_line.id}

    order_line_ids = []
    qline_ids = []

    params.keys.each do |key|
      if key[0..1] == 'rd' or key[0..1] == 'cm'
        order_line_ids.append key.split('_')[2] unless order_line_ids.include?(key.split('_')[2])
        qline_ids.append params[key] if key[0..1] == 'rd'
      end
    end

    order_lines = Tqrdc::OrderLine.find order_line_ids
    qlines = Tqrdc::Qline.find qline_ids

    htable = {}
    order_lines.each do |order_line|
      htable[order_line.id.to_s] = order_line
    end

    qline_table = {}
    qlines.each do |qline|
      qline_table[qline.id.to_s] = qline
    end

    params.keys.each do |key|
      buf = key.split('_')
      if buf[0] == 'rd'
        qline = qline_table[params[key]] if qline_table[params[key]]
        if qline
          if buf[1] == 'u1'
            htable[buf[2]].u1_score = qline.score
            htable[buf[2]].u1_sign_date = Time.now
            htable[buf[2]].u1_qline_id = qline.id
            htable[buf[2]].u1_ip = ip
          elsif buf[1] == 'u2'
            htable[buf[2]].u2_score = qline.score
            htable[buf[2]].u2_sign_date = Time.now
            htable[buf[2]].u2_qline_id = qline.id
            htable[buf[2]].u2_ip = ip
          elsif buf[1] == 'u3'
            htable[buf[2]].u3_score = qline.score
            htable[buf[2]].u3_sign_date = Time.now
            htable[buf[2]].u3_qline_id = qline.id
            htable[buf[2]].u3_ip = ip
          elsif buf[1] == 'u4'
            htable[buf[2]].u4_score = qline.score
            htable[buf[2]].u4_sign_date = Time.now
            htable[buf[2]].u4_qline_id = qline.id
            htable[buf[2]].u4_ip = ip
          end
        end
      elsif buf[0] == 'cm'
        unless params[key].nil? or params[key].empty?
          if buf[1] == 'u1'
            htable[buf[2]].u1_comment = params[key]
          elsif buf[1] == 'u2'
            htable[buf[2]].u2_comment = params[key]
          elsif buf[1] == 'u3'
            htable[buf[2]].u3_comment = params[key]
          elsif buf[1] == 'u4'
            htable[buf[2]].u4_comment = params[key]
          end
        end
      end
    end

    Tqrdc::Order.transaction do
      Tqrdc::OrderLine.transaction do
        order_lines.each do |order_line|
          order_line.save if order_line.changed?
        end
      end
      Tqrdc::OrderGroup.transaction do
        sql = "
          update tqrdc_order_group a set
           u1_tot=(select sum(b.u1_score) from tqrdc_order_line b where b.order_group_id=a.id and b.order_id=a.order_id),
           u2_tot=(select sum(b.u2_score) from tqrdc_order_line b where b.order_group_id=a.id and b.order_id=a.order_id),
           u3_tot=(select sum(b.u3_score) from tqrdc_order_line b where b.order_group_id=a.id and b.order_id=a.order_id),
           u4_tot=(select sum(b.u4_score) from tqrdc_order_line b where b.order_group_id=a.id and b.order_id=a.order_id)
          where a.order_id = #{order_lines.first.order.id}
        "
        Tqrdc::OrderGroup.connection.execute sql
      end

      sql = "
        update tqrdc_order a set
         u1_tot=(select sum(b.u1_score) from tqrdc_order_line b where b.order_id=a.id),
         u2_tot=(select sum(b.u2_score) from tqrdc_order_line b where b.order_id=a.id),
         u3_tot=(select sum(b.u3_score) from tqrdc_order_line b where b.order_id=a.id),
         u4_tot=(select sum(b.u4_score) from tqrdc_order_line b where b.order_id=a.id)
        where a.id = #{order_lines.first.order.id}
      "
      Tqrdc::OrderGroup.connection.execute sql
    end

    return order_lines.first.order_id
  end

  # def self.submit(order_id, user_id)
  #   order = Tqrdc::Order.find order_id
  #   Tqrdc::OrderLine
  #       .where("u#{order.seq}_user_id = #{user_id}")
  #       .where("seq = #{order.seq}")
  #       .update_all({:seq => order.seq + 1})
  #
  #
  #   # .eager_load(:order_groups, :order_lines)
  #   # .find order_id
  # end

  def self.monthly_create_order
    period = (Time.now - 1.month).strftime('%Y%m')
    suppliers = Tqrdc::Supplier
                    .where("'#{period}' between start_period and end_period")
                    .order(:territory => :asc, :supplier => :asc)

    sql = "select a.* from tqrdc_supplier a left join tqrdc_order b
              on a.id = b.supplier_id and b.period='#{period}'
            where '#{period}' between a.start_period and a.end_period
            and b.id is null  order by a.territory , supplier asc "
    suppliers = Tqrdc::Supplier.find_by_sql sql

    Tqrdc::Order.transaction do

      suppliers.each do |supplier|
        order = Tqrdc::Order.create(
            :supplier_id => supplier.id,
            :period => period,
            :status => 'CREATE',
            :territory => supplier.territory,
            :total => 0,
            :seq => 1
        )

        Tqrdc::Group.all.order(:id => :asc).each do |group|
          order_group = Tqrdc::OrderGroup.create(
              :order_id => order.id,
              :group_id => group.id,
              :status => 'CREATE',
              :total => 0
          )

          list = Tqrdc::Flow.where(:territory => supplier.territory)
                     .select(:qhead_id, :role, :user_id, :seq, :next_seq)
                     .order(:qhead_id, :seq => :asc)

          htable = {}
          list.each do |row|
            row.user_id = supplier.commodity_mgr_id if row.user_id.nil?
            htable["#{row.qhead_id}_#{row.seq}"] = row
          end

          qheads = Tqrdc::Qhead.where(:group_id => group.id).order(:name => :asc)
          qheads.each do |qhead|
            Tqrdc::OrderLine.create(
                :order_id => order.id,
                :order_group_id => order_group.id,
                :status => 'CREATE',
                :qhead_id => qhead.id,
                :final_score => 0,
                :u1_role => htable["#{qhead.id}_1"].role,
                :u1_user_id => htable["#{qhead.id}_1"].user_id,
                :u2_role => htable["#{qhead.id}_2"].role,
                :u2_user_id => htable["#{qhead.id}_2"].user_id,
                :u3_role => htable["#{qhead.id}_3"].role,
                :u3_user_id => htable["#{qhead.id}_3"].user_id,
                :u4_role => htable["#{qhead.id}_4"].role,
                :u4_user_id => htable["#{qhead.id}_4"].user_id,
                :seq => 1
            )
          end #qheads.each do |qhead|

        end #Tqrdc::Group.all.order(:id => :asc).each do |group|

      end #suppliers.each do |supplier|

    end #qrdc::Order.transaction

  end

  def self.wip
    sql = "
        select distinct o.id,s.vname,s.supplier,o.territory,o.period,o.u1_user_id user_id, u.email, u.username, o.seq from (
            select distinct a.id,a.supplier_id, a.period, a.territory, b.u1_user_id, a.seq from tqrdc_order a
              join tqrdc_order_line b on b.order_id = a.id and b.seq=a.seq
            where a.status <> 'CLOSE' and a.seq = 1
            union
            select distinct a.id,a.supplier_id, a.period, a.territory, b.u2_user_id, a.seq from tqrdc_order a
              join tqrdc_order_line b on b.order_id = a.id and b.seq=a.seq
            where a.status <> 'CLOSE' and a.seq = 2
            union
            select distinct a.id,a.supplier_id, a.period, a.territory, b.u3_user_id, a.seq from tqrdc_order a
              join tqrdc_order_line b on b.order_id = a.id and b.seq=a.seq
            where a.status <> 'CLOSE' and a.seq = 3
            union
            select distinct a.id,a.supplier_id, a.period, a.territory, b.u4_user_id, a.seq from tqrdc_order a
              join tqrdc_order_line b on b.order_id = a.id and b.seq=a.seq
            where a.status <> 'CLOSE' and a.seq = 4
        ) o
         join tqrdc_supplier s on s.id = o.supplier_id
         join users u on u.id = o.u1_user_id
      order by o.id
    "
  end

end
