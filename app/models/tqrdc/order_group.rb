class Tqrdc::OrderGroup < ActiveRecord::Base
    belongs_to :order, :class_name => 'Tqrdc::Order'
    belongs_to :group, :class_name => 'Tqrdc::Group'
    has_many :order_lines, :class_name => 'Tqrdc::OrderLine', :dependent => :destroy
    #validates_presence_of :name , :score
end
