class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :explain
    validates :image
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: {with: /\A[0-9]+\z/}
    # 半角数字
    with_options numericality: { other_than: 1 } do
      # id:1以外のときに保存できる
      validates :charge_id
      validates :area_id
      validates :delivery_date_id    
      validates :category_id
      validates :status_id
    end    
  end
  
  belongs_to :user
  has_one :buyer
  belongs_to_active_hash :charge
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery_date
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  has_one_attached :image
end
