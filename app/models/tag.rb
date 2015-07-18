class Tag < ActiveRecord::Base
  belongs_to :post
	belongs_to :taggings

	has_many :taggings
	has_many :tags, through: :taggings
end
