FactoryBot.define do
  factory :user do
    nickname { Faker::Name }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    profile { Faker::Lorem.sentence }
  end
end
