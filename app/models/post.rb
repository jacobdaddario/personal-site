class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true, format: { with: /[0-9]*/}

  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, presence: true, uniqueness: true, length: { maximum: 80 }
  validates :content, presence: true

  # Sorts the posts by date created
  default_scope -> { order(created_at: :desc) }
end
