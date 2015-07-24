class Tqrdc::Order < ActiveRecord::Base
  has_many :ordergroups, :class_name => 'Tqrdc::OrderGroup', :dependent => :destroy
  has_many :orderlines, :class_name => 'Tqrdc::OrderLine' , :dependent => :destroy
end
