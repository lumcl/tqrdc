class Tqrdc::OrderLine < ActiveRecord::Base
  belongs_to :ordergroup ,:class_name => 'Tqrdc::OrderGroup'
end
