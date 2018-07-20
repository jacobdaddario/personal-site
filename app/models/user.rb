class User < ApplicationRecord
  # Remember that uniqueness can have certain scopes set.
  # Don't forget to index the DB to also check for uniqnuess.
  # Also good for speed, but more important for big sites
  validates :name, presence: true, uniqueness: true, length: { maximum: 70 }
end
