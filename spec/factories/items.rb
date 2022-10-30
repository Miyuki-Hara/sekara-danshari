FactoryBot.define do
  factory :item do
    association :user

    name { Faker::Name.name }
    category_id { Faker::Number.between(from: 2, to: 12) }
    let_go_way_id { Faker::Number.between(from: 2, to: 7) }
    let_go_reason_id { Faker::Number.between(from: 2, to: 7) }
    result_id { Faker::Number.between(from: 1, to: 4) }
    comment { Faker::Lorem.sentence }

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
