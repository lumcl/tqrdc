class User < ActiveRecord::Base
  self.table_name ='users'
  self.sequence_name = 'user_seq'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable,:registerable,
  # :validatable

  devise :database_authenticatable, :recoverable, :rememberable, :trackable


  def name
    username
  end

  def to_s
    username
  end
end
