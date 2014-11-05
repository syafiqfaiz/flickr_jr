class Photo < ActiveRecord::Base
  # Remember to create a migration!
  mount_uploader :source, PhotoUploader
  belongs_to :album
end
