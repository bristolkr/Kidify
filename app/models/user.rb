class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

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
  has_many :events
  has_many :attachments
  has_many :groups
  has_many :memberships
  has_many :membered_groups, :through => :memberships, :source => :group
  belongs_to :group # to show current dashboard

  before_save :set_default_group

  def set_default_group
    self.group ||= membered_groups.first
  end
end
