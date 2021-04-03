class User < ApplicationRecord
	acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :validatable, 
         :confirmable
	def self.authenticate(email, user_token)
		where("email  = ? AND authentication_token= ?", email, user_token)
	end

	validates :user_name, uniqueness: true
 	has_many :profile

end
