class Token < ApplicationRecord
  belongs_to :user

  validates :token,
            presence: true,
            uniqueness: true
end
