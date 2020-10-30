class Order < ApplicationRecord
  has_one :shipping
  belongs_to :user
  has_one :product

end
