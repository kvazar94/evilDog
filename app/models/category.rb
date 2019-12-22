class Category < ApplicationRecord
	has_many :advertisements, :dependent => :destroy
	validates :name, presence: true
	has_ancestry
end
