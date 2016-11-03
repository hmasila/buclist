FactoryGirl.define do
  factory :item do
    name { Faker::Beer.name }
    done false
    bucket_list
  end
end
