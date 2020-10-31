class ProductsController < ApplicationController
  before_action :move_to_index, { only: [:edit, :update, :destroy] }
  before_action :find_params, { only: [:edit, :update, :show] }
  def index
    @products = Product.order("created_at DESC")
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

  def show; end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render 'show'
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

  def find_params
    @product = Product.find(params[:id])
  end

  def move_to_index
    @product = Product.find(params[:id])
    redirect_to action: :index unless user_signed_in? && current_user.id == @product.user_id
  end
end
