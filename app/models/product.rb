class Product < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  belongs_to :user
  has_many :pictures
  default_scope { order(id: :desc) }  
end
