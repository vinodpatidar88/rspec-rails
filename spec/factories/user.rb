FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    mobile_number { Faker::Alphanumeric.alpha(number: 10) }
    age { rand(10..60) }
    password { Faker::Internet.password }
    status { 'active' }

    trait :mobile_blank do
        mobile_number { nil }
    end
  end
end
