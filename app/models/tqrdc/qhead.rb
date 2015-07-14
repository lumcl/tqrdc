class Tqrdc::Qhead < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User'
  belongs_to :creator, :class_name => 'User'
  belongs_to :updater, :class_name => 'User'
  belongs_to :group ,:class_name => 'Tqrdc::Group'
  belongs_to :tqrdc_group, :class_name => 'Tqrdc::Group', foreign_key: 'group_id'
end