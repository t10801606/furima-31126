FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password              {password}
    password_confirmation {password}
    first_name            {Faker::Name.first_name}
    last_name             {Faker::Name.last_name}
    first_name_kana       {"test"}
    last_name_kana        {"test"}
    birth_day {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}

  end
end
