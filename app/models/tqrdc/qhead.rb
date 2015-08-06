class Tqrdc::Qhead < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User'
  belongs_to :creator, :class_name => 'User'
  belongs_to :updater, :class_name => 'User'
  belongs_to :group ,:class_name => 'Tqrdc::Group'
  has_many :qlines, :class_name => 'Tqrdc::Qline', :dependent => :destroy
  has_many :flows , :class_name => 'Tqrdc::Flow'
  validates_presence_of :name , :description , :score , :group
  def to_s
    name
  end
end