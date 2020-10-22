class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :load
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :day_to_ship

  
  
    has_many :comments
    belongs_to :user
    has_one_attached :image

  
    with_options presence: true do
    validates :image
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
  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :description, length: {maximum: 1000}
end
