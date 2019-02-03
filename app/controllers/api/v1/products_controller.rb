class API::V1::ProductsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    # raise params.inspect
    @product = Product.new(product_params)
    if @product.valid?
      @product.save!
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
    # whitelist params
    params.permit(:name, :expire_date, :sku_id, :price)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end


