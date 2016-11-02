FactoryGirl.define do
  factory :item do
    name { Faker::Beer.name }
    done false
    bucket_list_id 1
  end
end
