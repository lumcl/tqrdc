class Tqrdc::Order < ActiveRecord::Base
  belongs_to :supplier, :class_name => 'Tqrdc::Supplier'
  has_many :order_groups, :class_name => 'Tqrdc::OrderGroup', :dependent => :destroy
  has_many :order_lines, :class_name => 'Tqrdc::OrderLine', :dependent => :destroy

  validates_uniqueness_of :supplier_id, :scope => [:period]


  def self.update_scores(params)
    order_line_ids = Array.new
    qline_ids = Array.new
    params.keys.each do |key|
      order_line_ids.append key.split('_')[1]
      qline_ids.append params[key]
    end
    order_lines = Tqrdc::OrderLine.find order_line_ids
    qlines = Tqrdc::Qline.find qline_ids

  end

  def self.monthly_create_order
    period = Time.now.strftime('%Y%m')
    suppliers = Tqrdc::Supplier
                    .where("'#{period}' between start_period and end_period")
                    .order(:territory => :asc, :supplier => :asc)

    Tqrdc::Order.transaction do

      suppliers.each do |supplier|
        order = Tqrdc::Order.create(
            :supplier_id => supplier.id,
            :period => period,
            :status => 'CREATE',
            :territory => supplier.territory,
            :total => 0
        )

        Tqrdc::Group.all.order(:id => :asc).each do |group|
          order_group = Tqrdc::OrderGroup.create(
              :order_id => order.id,
              :group_id => group.id,
              :status => 'CREATE',
              :total => 0
          )
          qheads = Tqrdc::Qhead.where(:group_id => group.id).order(:name => :asc)
          qheads.each do |qhead|
            Tqrdc::OrderLine.create(
                :order_id => order.id,
                :order_group_id => order_group.id,
                :status => 'CREATE',
                :qhead_id => qhead.id,
                :final_score => 0
            )
          end #qheads.each do |qhead|

        end #Tqrdc::Group.all.order(:id => :asc).each do |group|

      end #suppliers.each do |supplier|

    end #qrdc::Order.transaction

  end

end
