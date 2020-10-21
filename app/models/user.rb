class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

with_options presence: true do
  validates :nickname
  validates :first_name
  validates :last_name
  validates :first_kana
  validates :last_kana
  validates :birthday
end

  validates :email, uniqueness: true
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :first_name, format: { with: VALID_NAME_REGEX}
  validates :last_name, format: { with: VALID_NAME_REGEX}
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :first_kana, format: { with: VALID_KANA_REGEX}
  validates :last_kana, format: { with: VALID_KANA_REGEX}  
  VALID_PASS_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[\w-]{8,128}+\z/i }

  
         
end
