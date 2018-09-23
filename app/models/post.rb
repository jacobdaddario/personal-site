class Post < ApplicationRecord
  attr_accessor :all_tags

  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates :user_id, presence: true, format: { with: /[0-9]*/}
  validates :title, presence: true, uniqueness: true, length: { maximum: 80 }
  validates :content, presence: true

  # Sorts the posts by date created
  default_scope { order(created_at: :desc) }
end