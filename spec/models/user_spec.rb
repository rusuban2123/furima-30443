require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
  context '新規登録がうまくいくとき' do
    it "それぞれ正しい値ならば登録できる" do
    @user.nickname = "testtrue" 
    @user.email = "testtrue@test.com" #@を含む
    @user.password = "true0000" #英数混合６文字以上
    @user.password_confirmation = "true0000" #passwordが一致
    @user.last_name = "試験テストてすと"  #全角ひらがなカタカタ漢字
    @user.first_name = "試験テストてすと" #全角ひらがなカタカナ漢字
    @user.first_kana = "テスト" #全角カタカナ
    @user.last_kana = "タロウ"  #全角カタカナ
    @user.birthday =  "1931-01-01"
    expect(@user).to be_valid
  end
end
context '新規登録がうまくいかないとき' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailが重複していると登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailは必ず@を含まなければならない" do
      @user.email = "testemail.email"    
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空だと登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank",
        "Password is invalid",
        "Password confirmation doesn't match Password")
    end
    it "passwordが６文字以下だと登録できない" do
      @user.password = 'edr32'
      @user.password_confirmation = 'edr32'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)","Password is invalid")
    end
    it "passwordが半角ローマ字のみだと登録できない" do
      @user.password = "wwwwww"
      @user.password_confirmation = "wwwwww"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが半角数字のみだと登録できない" do
      @user.password = "222222"
      @user.password_confirmation = "222222"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "確認用passwordの値がpasswordと一致しなければ登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_nameが空だと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_kanaが空だと登録できない" do
      @user.first_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana can't be blank")
    end
    it "last_kanaが空だと登録できない" do
      @user.last_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana can't be blank")
    end
    it "first_nameは全角入力でないと登録できない" do
      @user.first_name ="test"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "last_nameは全角入力でないと登録できない" do
      @user.last_name ="test"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it "first_kanaは全角(カタカナ)入力でないと登録できない" do
      @user.first_kana ="てすと"
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana is invalid")
    end
    it "last_kanaは全角(カタカナ)入力でないと登録できない" do
      @user.last_kana ="てすと"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana is invalid")
    end
    it "birthdayの入力が空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
   end
  end
end