class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    # 半角アルファベット（大文字・小文字・数値）
    validates :password, format: { with: PASSWORD_REGEX, message: 'Include both letters and numbers' }, length: { minimum: 6 }

    validates :birth_day
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
      # 全角ひらがな、全角カタカナ、漢字
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      # 全角カタカナ
      validates :first_name_kana
      validates :last_name_kana
    end
  end
  has_many  :items
  has_many  :buyers
end
