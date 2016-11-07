class Item < ApplicationRecord
  extend Pagination

  belongs_to :bucket_list

  validates :name,
            presence: true
end
