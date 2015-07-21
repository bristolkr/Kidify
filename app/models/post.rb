class Post < ActiveRecord::Base
  attr :tag_list
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user
  belongs_to :group
  has_many :comments, :dependent => :destroy
  accepts_nested_attributes_for :comments

  has_many :taggings
  has_many :tags, through: :taggings
  accepts_nested_attributes_for :taggings,
  											:reject_if => :all_blank,
  											:allow_destroy => true
  accepts_nested_attributes_for :tags
  validates_presence_of :body, :title

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end
end
