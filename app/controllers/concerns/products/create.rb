module Products::Create

  def self.run!(product, params, product_params)
    build(product, params, product_params)
  end

  private

  def self.build(product, params, product_params)
    create_tags(product, params[:tags])
    create_categories(product, params[:categories])
    create_images(product, product_params, params)
  end

  def self.create_tags(product, tags)
    tags.each do |tag|
      product.tags.where(name: tag.strip).first_or_create!
    end
  end

  def self.create_categories(product, categories)
    categories.each do |category|
      product.categories.where(name: category.strip).first_or_create!
    end
  end

  def self.create_images(product, product_params, params)
    # raise params[:images][0][:image_data].inspect

    product.save_attachments(params[:images])
  end

end