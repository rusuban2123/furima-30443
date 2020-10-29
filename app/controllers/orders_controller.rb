class OrdersController < ApplicationController
  before_action :product_params, only: [:index]
  
  def index
  end

  private
  def product_params
    @product = Product.find(params[:product_id])
  end


end



