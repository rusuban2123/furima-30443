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
  with_options format: { with: VALID_NAME_REGEX} do
   validates :first_name
   validates :last_name
  end
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  with_options format: { with: VALID_KANA_REGEX} do
   validates :first_kana
   validates :last_kana 
  end
  VALID_PASS_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
   validates :password, format: { with: VALID_PASS_REGEX }

  
         
end
