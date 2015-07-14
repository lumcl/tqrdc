class Tqrdc::Qhead < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User'
  belongs_to :creator, :class_name => 'User'
  belongs_to :updater, :class_name => 'User'

  belongs_to :group ,:class_name => 'Tqrdc::Group'
end
