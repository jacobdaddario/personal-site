class Post < ApplicationRecord
  before_action: :logged_in_user

  belongs_to :user
  validates :user_id, presence: true, format: { with: /[0-9]*/}

  validates :title, presence: true, uniqueness: true, length: { maximum: 80 }
  validates :content, presence: true

  # Sorts the posts by date created
  default_scope { order(created_at: :desc) }

  private
end
