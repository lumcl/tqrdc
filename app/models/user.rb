class User < ActiveRecord::Base
  self.table_name ='users'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable,:registerable,
  # :validatable

  devise :database_authenticatable, :recoverable, :rememberable, :trackable

end
