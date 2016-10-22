FactoryGirl.define do
  factory :user do
    firstname Faker::name.first_tname
    lastname Faker::name.last_name
    email { Faker::Internet.email }
    password Faker::Internet.password
  end
end
