FactoryBot.define do
  factory :user_profile do
    user_name { Faker::Internet.username }
    follower_count {rand(1000..5000)}
    following_count {rand(2000..3000)}
    url {Faker::Internet.url}
    website_url {'inactive'}
  end
end
