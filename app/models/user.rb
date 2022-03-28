class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items
         has_many :purchases

         validates :nickname, presence: true
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角の英字、数字の混合で設定してください' 
         with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
          validates :family_name
          validates :first_name
         end
         with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カナを使用してください' } do
          validates :family_name_kana
          validates :first_name_kana
         end
         validates :birth_day, presence: true
end
