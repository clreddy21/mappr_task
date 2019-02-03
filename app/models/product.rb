class Product < ActiveRecord::Base

  validates :name, presence: true
  validates :expire_date, presence: true
  validates :sku_id, presence: true
  validates :price, presence: true

end
