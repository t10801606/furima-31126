FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password              { password }
    password_confirmation { password }
    first_name            { 'ひらがなカタカナ漢字' }
    last_name             { 'ひらがなカタカナ漢字' }
    first_name_kana       { 'カタカナ' }
    last_name_kana        { 'カタカナ' }
    birth_day { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
