class Profile < ActiveRecord
 belongs_to :user
 validates_associated :user
end
