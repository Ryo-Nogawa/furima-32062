FactoryBot.define do
  factory :user do
    gimei = Gimei.new
    email                  { Faker::Internet.free_email }
    password               { 'test2020' }
    password_confirmation  { password }
    nickname               { Faker::Name.name }
    last_name              { gimei.last.kanji }
    first_name             { gimei.first.kanji }
    kana_last_name         { gimei.last.katakana }
    kana_first_name        { gimei.first.katakana }
    birthday               { Faker::Date.birthday }
  end
end
