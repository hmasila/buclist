class ItemSerializer < ActiveModel::Serializer
  include DateFormat
  attributes :id, :name, :date_created, :date_modified, :done
end
