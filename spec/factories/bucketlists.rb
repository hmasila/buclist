FactoryGirl.define do
  factory :bucketlist do
    name { Faker::Lorem.word }
    user_id 1
  end
end
