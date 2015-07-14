class Tqrdc::Group < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User' #, :foreign_key => 'owener_id', :primary_key => 'rid'
  belongs_to :creator, :class_name => 'User'
  belongs_to :updater, :class_name => 'User'
  has_many :qheads, :class_name => 'Tqrdc::Qhead'

  def to_s
    name
  end
end
