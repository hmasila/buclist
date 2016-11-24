class BucketlistSerializer < ActiveModel::Serializer
  include DateFormat
  attributes :id, :name, :items, :date_created, :date_modified, :created_by
  has_many :items

  def created_by
    object.user.full_name
  end
end
