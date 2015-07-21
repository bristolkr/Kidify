class Attachment < ActiveRecord::Base
  mount_uploader :image, FileUploader
  mount_uploader :document, FileUploader
end
