FactoryGirl.define do
  factory :bucket_list do
    name { Faker::Lorem.word }
    user
  end
end
