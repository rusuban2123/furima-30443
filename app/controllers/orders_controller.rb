class OrdersController < ApplicationController
  before_action :set_product, only: [:index, :create]
  
  def index
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(shipping_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      redirect_to root_path
    else
      render action: :index
    end
    
    
  end

  private
  def set_product
    @product = Product.find(params[:product_id])
  end

  def shipping_params
    params.require(:order_shipping).permit(:postal_code, :shipment_source_id, :shipping_city, :shipping_address,:shipping_building, :phone_number, :product_id).merge(token: params[:token], user_id: current_user.id, product_id: @product.id)
  end

  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: shipping_params[:token],
      currency: 'jpy'
    )
  end


end



