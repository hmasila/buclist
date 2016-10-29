class BucketList < ApplicationRecord
  belongs_to :user
  has_many :items

  validates :name, presence: true

  scope :search, -> (name) { where('name ILIKE ?', "%#{name}%") }

  scope :paginate, lambda do |parameters|
    limit(parameters[:limit]).offset(parameters[:offset])
  end
end
