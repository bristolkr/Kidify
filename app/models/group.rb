class Group < ActiveRecord::Base
  belongs_to :user
  has_many :memberships, :dependent => :destroy
  has_many :users, :through => :memberships
  has_many :posts, :dependent => :destroy
  has_many :events, :dependent => :destroy
  has_many :attachments, :dependent => :destroy

  after_create :assign_owner_as_member
  before_destroy :assign_another_group_to_owner

  def assign_owner_as_member
    user.membered_groups << self
    user.group = self
    user.save
  end

  def assign_another_group_to_owner
    user.group = user.membered_groups.where.not(:id => self.id).first
    user.save
  end
end
