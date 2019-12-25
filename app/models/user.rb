class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # has_one :profile, dependent: :destroy
  # after_create :create_profile
  
  has_many :advertisements, :dependent => :destroy

  

   private
    def create_role
      self.roles << Role.find_by_name(:user)  
    end

end
