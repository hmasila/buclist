FactoryGirl.define do
  factory :bucketlist do
    name { Faker::Lorem.word }
    user
  end
end
