class ImageValidator < ActiveModel::Validator

  def validate record
    # Validates if the image is in the app directory
    begin open(Rails.root.join "app", "assets", "images", record.avatar)
    rescue
      record.errors[:base] << "The image is not in the image directory"
    end
  end

end

class User < ApplicationRecord

  before_validation :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_IMAGE_REGEX = /([^\s]+(\.(?i)(jpg|png|gif|bmp))$)/

  has_many :posts, dependent: :destroy

  # Remember that uniqueness can have certain scopes set.
  # Don't forget to index the DB to also check for uniqnuess.
  # Also good for speed, but more important for big sites
  validates :name, presence: true, uniqueness: true, length: { maximum: 70 }
  validates :email, presence: true, uniqueness: { case_sensative: false },
                    length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :info, presence: true, length: { maximum: 255 }
  validates :avatar, presence: true, format: { with: VALID_IMAGE_REGEX }
  validates_with ImageValidator

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  private

  def downcase_email
    email.to_s.downcase!
  end

end

