class Item < ApplicationRecord
  belongs_to :bucket_list

  validates :name,
            presence: true
end
