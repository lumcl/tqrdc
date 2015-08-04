class Tqrdc::Qline < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User'
  belongs_to :creator, :class_name => 'User'
  belongs_to :updater, :class_name => 'User'
  belongs_to :qhead ,:class_name => 'Tqrdc::Qhead'
  belongs_to :group ,:class_name => 'Tqrdc::Group'
  validates_presence_of :name , :description , :score , :group
  def score_with_name
    "[ #{score.to_i} ] - #{name}"
  end
end
