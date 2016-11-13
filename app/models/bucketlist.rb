class Bucketlist < ApplicationRecord
  extend Pagination
  belongs_to :user
  has_many :items, dependent: :destroy

  validates :name, presence: true

  scope(:search, lambda do |name|
    bucketlists = where("name ILIKE ?", "%#{name}%")
    raise(
      ActiveRecord::RecordNotFound, Messages.not_found(name)
    ) if bucketlists.blank?
    bucketlists
  end)
end
