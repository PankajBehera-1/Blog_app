class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
    mount_uploader :video, VideoUploader
    
    validates :title, presence: true
    belongs_to :user
end
