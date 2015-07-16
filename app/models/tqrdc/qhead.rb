class Tqrdc::Qhead < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User'
  belongs_to :creator, :class_name => 'User'
  belongs_to :updater, :class_name => 'User'
  belongs_to :group ,:class_name => 'Tqrdc::Group'
  has_many :qlines, :class_name => 'Tqrdc::Qline', :dependent => :destroy

  def to_s
    name
  end
end