FactoryBot.define do
  factory :user_purchase do
    postal_code      { '123-4567' }
    region_id        { 2 }
    city             { Faker::Address.city }
    address          { Faker::Address.building_number }
    building         { Faker::Address.building_number }
    phone            { '09012345678' }
    token            { 'tok_abcdefghijk00000000000000000' }
  end
end
