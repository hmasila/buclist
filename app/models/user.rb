class User < ApplicationRecord
  has_many :bucket_lists
  has_secure_password

  VALID_EMAIL = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :name, presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: VALID_EMAIL }
end
