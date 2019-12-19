class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :confirmable, :validatable

  has_one :profile
  
  has_many :advertisements

   private
    def create_role
      self.roles << Role.find_by_name(:user)  
    end

end
