class Post < ApplicationRecord
	mount_uploader :image, ImageUploader
	validates :title, :short_description, :description, presence: true
end
