require 'rails_helper'
RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload('images/sample.png')
  end
  describe '商品情報の保存' do
    context '商品情報が正しく保存できる'
    it 'それぞれが正しい値なら保存できる' do
      expect(@product).to be_valid
    end
    context '商品情報が保存できない'
    it '商品名が空だと保存できない' do
      @product.name = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it '画像がないと保存できない' do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Image can't be blank")
    end
    it '説明文が空だと保存できない' do
      @product.description = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Description can't be blank")
    end
    it '説明文が1000字以上だと保存できない' do
      @product.description = 'a' * 1001
      @product.valid?
      expect(@product.errors.full_messages). to include('Description is too long (maximum is 1000 characters)')
    end
    it 'カテゴリーが空だと保存できない ' do
      @product.category_id = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態が空だと保存できない' do
      @product.state_id = ''
      @product.valid?
      expect(@product.errors.full_messages). to include("State can't be blank")
    end
    it '配送料の負担が空だと保存できない' do
      @product.load_id = ''
      @product.valid?
      expect(@product.errors.full_messages). to include("Load can't be blank")
    end
    it '発送元の地域が空だと保存できない' do
      @product.shipment_source_id = ''
      @product.valid?
      expect(@product.errors.full_messages). to include("Shipment source can't be blank")
    end
    it '発想までの日数が空だと保存できない' do
      @product.day_to_ship_id = ''
      @product.valid?
      expect(@product.errors.full_messages). to include("Day to ship can't be blank")
    end
    it '販売価格が空だと保存できない' do
      @product.price = ''
      @product.valid?
      expect(@product.errors.full_messages). to include("Price can't be blank")
    end
    it '販売価格が300円以下だと保存できない' do
      @product.price = 299
      @product.valid?
      expect(@product.errors.full_messages). to include('Price must be greater than or equal to 300')
    end
    it '販売価格が9999999円以上だと保存できない' do
      @product.price = 10_000_000
      @product.valid?
      expect(@product.errors.full_messages). to include('Price must be less than 9999999')
    end
    it '販売価格が半角数字でないと保存できない' do
      @product.price = 'test'
      @product.valid?
      expect(@product.errors.full_messages). to include('Price is not a number')
    end
  end
end
