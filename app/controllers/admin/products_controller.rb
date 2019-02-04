class Admin::ProductsController < ApplicationController

  skip_before_action :verify_authenticity_token


  def index
    @products = Product.all
  end

  def show
    @product = set_product
  end

  def edit

  end

  def update
    @product = set_product

    if @product.update!(product_params)
      Products::Update.run!(@product, params, product_params)
      flash[:success] = "Product is updated!"
      redirect_to admin_product_path(@product)
    else
      flash[:fail] = "Product update is failed!"
      redirect_to admin_product_path(@product)
    end
  end

  private

  def product_params
    params.require(:@product).permit(:name, :sku_id, :price, :expire_date)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end


