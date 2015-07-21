class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  mount_uploader :attachment, FileUploader

  extend FriendlyId
  friendly_id :name, use: :slugged

  def set_default_role
    self.role ||= :user
  end

  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         :lockable, :timeoutable

  has_many :posts
  has_many :comments
  has_and_belongs_to_many :events
  has_many :attachments
end
