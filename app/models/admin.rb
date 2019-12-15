class Admin < ApplicationRecord
	devise :database_authenticatable, :rememberable, :confirmable, :validatable
end