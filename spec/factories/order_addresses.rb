FactoryBot.define do
  factory :order_address do
    gimei = Gimei.new
    token          {"tok_abcdefghijk00000000000000000"}
    postal_code    {Faker::Address.zip}
    prefectual_id  {Faker::Number.between(from: 1, to: 47)}
    city           {gimei.city.kanji}
    house_number   {Faker::Address.street_address}
    phone_number   {Faker::Number.number(11)}
  end
end
