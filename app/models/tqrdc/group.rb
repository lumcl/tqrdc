class Tqrdc::Group < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User' #, :foreign_key => 'owener_id', :primary_key => 'rid'
  belongs_to :creator, :class_name => 'User'
  belongs_to :updater, :class_name => 'User'
  has_many :qheads, :class_name => 'Tqrdc::Qhead', :dependent => :destroy
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :score
  def to_s
    name
  end
end
