class Tqrdc::OrderGroup < ActiveRecord::Base
    belongs_to :order ,:class_name => 'Tqrdc::Order'
    has_many :orderline, :class_name => 'Tqrdc::OrderLine', :dependent => :destroy
    validates_presence_of :name , :score
end
