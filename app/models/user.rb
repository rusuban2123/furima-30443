class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :nickname, :birthday, presence: true
  validates :email, uniqueness: true
  validates :email,presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX}
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX}
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :first_kana, presence: true, format: { with: VALID_KANA_REGEX}
  validates :last_kana, presence: true, format: { with: VALID_KANA_REGEX}  
  validates :encrypted_password, presence: true, confirmation: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])[a-z\d]{６}+\z/ }

  
         
end
