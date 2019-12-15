class Advertisement < ApplicationRecord
	mount_uploader :image, ImageUploader


	belongs_to :user
	belongs_to :category
	
	validates :title, :body, presence: true

end
