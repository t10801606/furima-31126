class UserPurchase
  include ActiveModel::Model 
  attr_accessor :postal_code, :region_id, :city, :address, :building, :phone


# acceptancesテーブル
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    valodates :address
    valodates :phone, length: {maximum: 11}
    end
  end
    varidates :region_id, numericality: { other_than: 1 }
  def save
    Acceptance.create(postal_code: postal_code, region_id: region_id, city: city, address: address, building: building, phone: phone, buyer_id: buyer.id ) 
    Buyer.create(user_id: user.id, item_id: item.id)
  end

end