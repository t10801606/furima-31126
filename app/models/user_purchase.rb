class UserPurchase 
  include ActiveModel::Model 
  attr_accessor :postal_code, :region_id, :city, :address, :building, :phone, :user_id, :item_id, :buyer_id


  # acceptancesテーブル
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone, length: { maximum: 11 }, format: { with: /\A\d{10,11}\z/, message: "number Input only number"}
    with_options numericality: { other_than: 1 } do
      # id:1以外のときに保存できる
      validates :region_id
    end
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Acceptance.create(postal_code: postal_code, region_id: region_id, city: city, address: address, building: building, phone: phone, buyer_id: buyer.id)
  end
end