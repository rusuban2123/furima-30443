class Order < ApplicationRecord
  validates :price, presence: true
  belongs_to :product
end
