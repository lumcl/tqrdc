class Tqrdc::OrderLine < ActiveRecord::Base
  belongs_to :order_group ,:class_name => 'Tqrdc::OrderGroup'
  belongs_to :qhead, :class_name => 'Tqrdc::Qhead'
end
