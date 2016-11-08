class BucketList < ApplicationRecord
  extend Pagination
  belongs_to :user
  has_many :items

  validates :name, presence: true

  scope :search, -> (name) { where("name ILIKE ?", "%#{name}%") }
end
