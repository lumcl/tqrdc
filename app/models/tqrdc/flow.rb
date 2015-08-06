class Tqrdc::Flow < ActiveRecord::Base
  belongs_to :user
  belongs_to :owner, :class_name => 'User' #, :foreign_key => 'owener_id', :primary_key => 'rid'
  belongs_to :creator, :class_name => 'User'
  belongs_to :updater, :class_name => 'User'
  belongs_to :qhead ,:class_name => 'Tqrdc::Qhead'

  validates_presence_of :name , :qhead_id , :role , :territory , :seq , :next_seq

  def to_s
    name
  end
end
