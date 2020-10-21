require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nickname、email、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kana、birth_dayが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'emailに@が含まれないと登録できないこと' do
      @user.email = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_nameが全角ひらがな、全角カタカナ、漢字以外では登録できないこと' do
      @user.first_name = "taro"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it 'last_nameが空では登録できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'last_nameが全角ひらがな、全角カタカナ、漢字以外では登録できないこと' do
      @user.last_name = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it 'first_name_kanaが空では登録できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'first_name_kanaが全角カタカナ以外では登録できないこと' do
      @user.first_name_kana = "太郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it 'last_name_kanaが空では登録できないこと' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'last_name_kanaが全角カタカナ以外では登録できないこと' do
      @user.last_name_kana = "太郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it 'birth_dayが空では登録できないこと' do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
