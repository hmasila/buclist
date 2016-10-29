class BucketList < ApplicationRecord
  belongs_to :user
  has_many :items

  validates :name, presence: true

  scope :search, -> (name) { where('name ILIKE ?', "%#{name}%") }

  scope :paginate, (lambda do |page, per_page|
    off_set = (page - 1) * per_page + 1
    limit(per_page).offset(off_set)
  end)
end
