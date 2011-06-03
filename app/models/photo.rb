class Photo < ActiveRecord::Base
  belongs_to :apartment
  mount_uploader :file, PhotoUploader

  default_scope order('photo_order asc')

end
