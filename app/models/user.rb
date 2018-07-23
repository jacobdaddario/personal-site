class User < ApplicationRecord

  before_validation :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # Remember that uniqueness can have certain scopes set.
  # Don't forget to index the DB to also check for uniqnuess.
  # Also good for speed, but more important for big sites
  validates :name, presence: true, uniqueness: true, length: { maximum: 70 }
  validates :email, presence: true, uniqueness: { case_sensative: false },
                    length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

  private

    def downcase_email
      # DANGER, using bang on an already downcased email will return nil
      self.email = email.to_s.downcase
    end
end
