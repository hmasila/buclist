FactoryGirl.define do
  factory :item do
    name { Faker::Beer.name }
    done false
    bucketlist
  end
end
