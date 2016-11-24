class Item < ApplicationRecord
  extend Pagination

  belongs_to :bucketlist

  validates :name,
            presence: true
end
