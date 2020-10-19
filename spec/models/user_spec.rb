require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.nickname = ""
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = FactoryBot.build(:user)
      user.email = ""
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end
    it "emailは必ず@を含まなければならない" do
      user = FactoryBot.build(:user)
      user.email = "testemail.email"    
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.encrypted_password = ""
      user.valid?
      expect(user.errors.full_messages).to include("Encrypted password can't be blank")
    end
    it "passwordが６文字以下だと登録できない" do
      user = FactoryBot.build(:user)
      user.encrypted_password = "edr32"
      user.valid?
      expect(user.errors.full_messages).to include("Encrypted password is too short (minimum is 6 characters)")
    end
    it "passwordが半角英数混合でないと登録できない" do
      user = FactoryBot.build(:user)
      user.encrypted_password = "wwwwww"
      user.valid?
      expect(user.errors.full_messages).to include("Encrypted password is invalid")
    end
    it "確認用passwordの値がpasswordと一致しなければ登録できない" do
      user = FactoryBot.build(:user)
      user.encrypted_password_confirmation = ""
      user.valid?
      expect(user.errors.full_messages).to include("Encrypted password confirmation doesn't match Encrypted password","Encrypted password is invalid")
    end
    it "first_nameが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.first_name = ""
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_nameが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.last_name = ""
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_kanaが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.first_kana = ""
      user.valid?
      expect(user.errors.full_messages).to include("First kana can't be blank")
    end
    it "last_kanaが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.last_kana = ""
      user.valid?
      expect(user.errors.full_messages).to include("Last kana can't be blank")
    end
    it "first_nameは全角入力でないと登録できない" do
      user = FactoryBot.build(:user)
      user.first_name ="test"
      user.valid?
      expect(user.errors.full_messages).to include("First name is invalid")
    end
    it "last_nameは全角入力でないと登録できない" do
      user = FactoryBot.build(:user)
      user.last_name ="test"
      user.valid?
      expect(user.errors.full_messages).to include("Last name is invalid")
    end
    it "first_kanaは全角(カタカナ)入力でないと登録できない" do
      user = FactoryBot.build(:user)
      user.first_kana ="てすと"
      user.valid?
      expect(user.errors.full_messages).to include("First kana is invalid")
    end
    it "last_kanaは全角(カタカナ)入力でないと登録できない" do
      user = FactoryBot.build(:user)
      user.last_kana ="てすと"
      user.valid?
      expect(user.errors.full_messages).to include("Last kana is invalid")
    end
    it "birthdayの入力が空だと登録できない" do
      user = FactoryBot.build(:user)
      user.birthday = ""
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end