# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # has_one :profile, dependent: :destroy
  # after_create :create_profile

  has_many :advertisements, dependent: :destroy

  def self.create_new_user(params)
    @user = User.create!(params)
  end

  private

  def create_role
    roles << Role.find_by_name(:user)
  end
end
