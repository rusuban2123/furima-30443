class OrderShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :shipment_source_id, :shipping_city, :shipping_address, :shipping_building,
  :phone_number, :user_id, :product_id, :token, :order_id

  validates :token, presence: true

  with_options presence: true do
    validates :shipment_source_id
    validates :shipping_city
    validates :shipping_address
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone_number, format: { with: /\A\d{11}\z/ }
  end



  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Shipping.create(postal_code: postal_code, shipment_source_id: shipment_source_id, shipping_city: shipping_city, shipping_address: shipping_address, shipping_building: shipping_building, phone_number: phone_number, order: order)
  end


end
