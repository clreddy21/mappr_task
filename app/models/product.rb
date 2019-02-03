class Product < ActiveRecord::Base

  has_many :taggings
  has_many :tags, through: :taggings

  has_many :product_categories
  has_many :categories, through: :product_categories

  has_many :images

  # before_validation :parse_image
  attr_accessor :image_data
  attr_accessor :image_base
  attr_accessor :image_name

  validates :name, presence: true
  validates :expire_date, presence: true
  validates :sku_id, presence: true
  validates :price, presence: true


  def save_attachments(params)
    params.each do |param|
      self.images.create!(:file_contents => param[:image_data])
    end
  end

  private

  # def parse_image
  #   image = Paperclip.io_adapters.for(image_base)
  #   image.original_filename = image_name.present? ? image_name : "#{Product.name}_image_#{Time.now}"
  #   self.picture = image
  # end

end
