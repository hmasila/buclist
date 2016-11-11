class Bucketlist < ApplicationRecord
  extend Pagination
  belongs_to :user
  has_many :items, dependent: :destroy

  validates :name, presence: true

  scope(:search, lambda do |name|
    bucketlists = where("name ILIKE ?", "%#{name}%")
    return Messages.not_found(name).to_json if bucketlists.blank?
    bucketlists
  end)
end
