FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    mobile_number {Faker::Alphanumeric.alpha(number: 10)}
    status {'active'}
  end
end
