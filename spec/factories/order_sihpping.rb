FactoryBot.define do
  factory :order_shipping do
    token                { 'tok_aaaaa11111' }
    postal_code          { '123-4567' }
    shipment_source_id   { 2 }
    shipping_city        { '試験市' }
    shipping_address     { 'テスト' }
    phone_number         { '09012345678' }
  end
end
