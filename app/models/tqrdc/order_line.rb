class Tqrdc::OrderLine < ActiveRecord::Base
  belongs_to :order_group, :class_name => 'Tqrdc::OrderGroup'
  belongs_to :qhead, :class_name => 'Tqrdc::Qhead'
  belongs_to :order, :class_name => 'Tqrdc::Order'
  belongs_to :u1_user, :class_name => 'User'
  belongs_to :u2_user, :class_name => 'User'
  belongs_to :u3_user, :class_name => 'User'
  belongs_to :u4_user, :class_name => 'User'
end
