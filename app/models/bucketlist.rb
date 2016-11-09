class Bucketlist < ApplicationRecord
  extend Pagination
  belongs_to :user
  has_many :items

  validates :name, presence: true

  scope(:search, lambda do |name|
    bucketlists = where("name ILIKE ?", "%#{name}%")
    return Messages.not_found(name) if bucketlists.blank?
    bucketlists
  end)
end
