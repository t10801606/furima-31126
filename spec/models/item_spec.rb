require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'name、explain、charge_id、area_id、delivery_date_id、price、category_id、status_id、imageが存在すれば登録できること' do
      expect(@item).to be_valid
    end

    it '画像が含まれないと登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が含まれないと登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が含まれないと登録できないこと' do
      @item.explain = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explain can't be blank")
    end

    it 'カテゴリーの情報が含まれない(idが1の場合)と登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it '商品の状態についての情報が含まれない(idが1の場合)と登録できないこと' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 1')
    end

    it '配送料の負担についての情報が含まれない(idが1の場合)と登録できないこと' do
      @item.charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Charge must be other than 1')
    end

    it '発送元の地域についての情報が含まれない(idが1の場合)と登録できないこと' do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Area must be other than 1')
    end

    it '発送までの日数についての情報が含まれない(idが1の場合)と登録できないこと' do
      @item.delivery_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery date must be other than 1')
    end

    it '価格の情報が含まれないと登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が¥300未満だと登録できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '価格が¥10,000,000以上だと登録できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it 'ユーザーが紐づいてないと登録できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
