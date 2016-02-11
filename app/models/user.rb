class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :lockable, :rememberable, :trackable, :validatable

  validates :username, :first_name, :last_name, :presence => true
end
