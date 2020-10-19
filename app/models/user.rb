class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :birthday, presence: true
  validates :email, uniqueness: true
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX}
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX}
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :first_kana, presence: true, format: { with: VALID_KANA_REGEX}
  validates :last_kana, presence: true, format: { with: VALID_KANA_REGEX}  
  VALID_PASS_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[\w-]{8,128}+\z/i }

  
         
end
