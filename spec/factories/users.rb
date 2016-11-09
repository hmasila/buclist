FactoryGirl.define do
  factory :user do
    firstname Faker::Name.first_name
    lastname Faker::Name.last_name
    email "hannah@andela.com"
    password "masila"
  end
end
