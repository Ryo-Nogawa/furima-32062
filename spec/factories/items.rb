FactoryBot.define do
  factory :item do
    title             { Faker::Lorem.characters(number: 40) }
    detail            { Faker::Lorem.characters(number: 1000) }
    category_id       { Faker::Number.between(from: 2, to: 11) }
    item_condition_id { Faker::Number.between(from: 2, to: 7) }
    item_cost_id      { Faker::Number.between(from: 2, to: 3) }
    delivery_area_id  { Faker::Number.between(from: 1, to: 47) }
    delivery_date_id  { Faker::Number.between(from: 2, to: 4) }
    price             { Faker::Number.between(from: 300, to: 9999999) }
    image             { }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
