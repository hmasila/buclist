FactoryGirl.define do
  factory :item do
    name { Faker::Beer.name }
    done false
    bucketlist_id 1
  end
end
