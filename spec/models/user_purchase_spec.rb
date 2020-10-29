require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe '商品購入機能' do
    before do
      @user_purchase = FactoryBot.build(:user_purchase)
    end

    it 'postal_code,region_id,city,address,building,phoneが存在すれば登録できること' do
      expect(@user_purchase).to be_valid
    end

    it '郵便番号が含まれないと登録できないこと' do
      @user_purchase.postal_code = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号にハイフンが含まれないと登録できないこと' do
      @user_purchase.postal_code = 1234567
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it '都道府県が含まれない(idが1の場合)と登録できないこと' do
      @user_purchase.region_id = 1
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Region must be other than 1")
    end

    it '市町村が含まれないと登録できないこと' do
      @user_purchase.city = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("City can't be blank")
    end

    it '番地が含まれないと登録できないこと' do
      @user_purchase.address = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が含まれないと登録できないこと' do
      @user_purchase.phone = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone can't be blank")
    end

    it '電話番号が12桁以上だと登録できないこと' do
      @user_purchase.phone = "090123456789"
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
    end

    it '電話番号にハイフンがあると登録できないこと' do
      @user_purchase.phone = "090-123-456"
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone number Input only number")
    end

    it "tokenが空では登録できないこと" do
      @user_purchase.token = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
    end

  end
end
