FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    mobile_number { Faker::Alphanumeric.alpha(number: 10) }
    age { rand(10..60) }
    password { Faker::Internet.password }
    status { 'inactive' }
  end

  factory :user_profile do
    user_name {Faker::Name.userName}
    follower_count {rand(1000..5000)}
    following_count {rand(2000..3000)}
    url {Faker::Internet.url}
    website_url {'inactive'}
  end
end
