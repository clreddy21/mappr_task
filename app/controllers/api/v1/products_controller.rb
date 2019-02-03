class API::V1::ProductsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    @product = Product.new(product_params)
    if @product.save!
      Products::Create.run!(@product, params, product_params)
      json_response(@product, :created)
    else
      json_response(@product.errors.full_messages.join(','), :'500')
    end
  end

  def edit

  end

  def update
    @product.update(product_params)
    head :no_content
  end

  private

  def product_params
    params.require(:product).permit(:name, :expire_date, :sku_id, :price, :image_base, :image_name, :image_data => [], :tags => [])
  end

  def set_product
    @product = Product.find(params[:id])
  end

end


