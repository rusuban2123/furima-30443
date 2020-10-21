class Product < ApplicationRecord
  with_options presence: true do
    validates :user
    validates :name
    validates :description
    validates :category_id
    validates :state_id
    validates :load_id
    validates :shipment_source_id
    validates :day_to_ship_id
    validates :price
  end

  validates :price, :numericality => { :greater_than_or_equal_to => 300 }  
  validates :price, :numericality => { :less_than => 9999999 } 
end
