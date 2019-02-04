module Products::Update

  def self.run!(product, params, product_params)
    build(product, params, product_params)
  end

  private

  def self.build(product, params, product_params)
    update_tags(product, params[:tags]) unless params[:tags].blank?
    update_categories(product, params[:categories]) unless params[:categories].blank?
    update_images(product, product_params, params) unless params[:images].nil?
  end

  def self.update_tags(product, tags)
    tags.each do |tag|
      product.tags.where(name: tag.strip).first_or_create!
    end
  end

  def self.update_categories(product, categories)
    categories.each do |category|
      product.categories.where(name: category.strip).first_or_create!
    end
  end

  def self.update_images(product, product_params, params)
    product.update_attachments(params[:images])
  end

end