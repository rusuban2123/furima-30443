class Shipping < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipment_source
  belongs_to :order
  with_options presence: true do
    validates :postal_cord
    validates :shipment_source_id
    validates :shipping_city
    validates :shipping_address 
    validates :phone_number
    validates :shipment_source_id
  end
  validates :phone_number, uniqueness: true
  validates :phone_number, format: { with: /\A[0-9]+\z/ }
  validates :postal_code, format: { with: /\A\d{7}\z/ }

end
