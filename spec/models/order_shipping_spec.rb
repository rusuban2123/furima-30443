require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    @order_shipping = FactoryBot.build(:order_shipping)
  end

  describe '商品購入機能' do
    context '商品が購入出来る' do
      it 'token, postal_code, shipment_source_id, shipping_city, shipping_address, phone_numberが存在すれば購入できる' do
        expect(@order_shipping).to be_valid
      end
    end

    context '商品が購入できない' do
      it 'tokenが空だと購入できない' do
        @order_shipping.token = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeにハイフンがないと購入できない' do
        @order_shipping.postal_code = '1111111'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages). to include('Postal code is invalid')
      end

      it 'postal_codeが空だと購入できない' do
        @order_shipping.postal_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages). to include("Postal code can't be blank")
      end

      it 'shipment_source_idが空だと購入できない' do
        @order_shipping.shipment_source_id = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages). to include("Shipment source can't be blank")
      end

      it 'shipping_cityが空だと購入できない' do
        @order_shipping.shipping_city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages). to include("Shipping city can't be blank")
      end

      it 'shipping_adressが空だと購入できない' do
        @order_shipping.shipping_address = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages). to include("Shipping address can't be blank")
      end

      it 'phone_numberが12桁以上だと購入できない' do
        @order_shipping.phone_number = '123456789012'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages). to include('Phone number is invalid')
      end

      it 'phone_numberが空だと購入できない' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages). to include("Phone number can't be blank", 'Phone number is invalid')
      end
    end
  end
end
