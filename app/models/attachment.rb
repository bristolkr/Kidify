class Attachment < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  mount_uploader :image, FileUploader
  mount_uploader :document, FileUploader
end
