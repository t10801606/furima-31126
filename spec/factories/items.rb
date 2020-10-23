FactoryBot.define do
  factory :item do
    name             { Faker::Name.name }
    explain          { '2010年頃に1万円で購入したジャケットです。ライトグレーで傷はありません。あわせやすいのでおすすめです。' }
    charge_id        { 2 }
    area_id          { 2 }
    delivery_date_id { 2 }
    price            { 1000 }
    category_id      { 2 }
    status_id        { 2 }
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
