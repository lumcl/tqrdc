class Tqrdc::Qline < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User'
  belongs_to :creator, :class_name => 'User'
  belongs_to :updater, :class_name => 'User'
  belongs_to :qheads ,:class_name => 'Tqrdc::Qhead'


end
