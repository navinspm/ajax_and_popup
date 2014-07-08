class Person < ActiveRecord::Base
	mount_uploader :image, ImageUploader
end
