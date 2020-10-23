class ProductsController < ApplicationController
  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.valid?
      @product.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :image, :name, :description, :category_id,
      :state_id, :load_id, :shipment_source_id,
      :day_to_ship_id, :price
    ).merge(user_id: current_user.id)
  end
end
