class Category < ApplicationRecord
	has_many :advertisements
	validates :name, presence: true
	has_ancestry
end
