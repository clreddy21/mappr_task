class Image < ActiveRecord::Base

  has_attached_file :file
  belongs_to :product
  before_validation :parse_file
  attr_accessor :file_contents
  validates_attachment :file, presence: true
  do_not_validate_attachment_file_type :file

  private

  def parse_file
    file = Paperclip.io_adapters.for(file_contents)
    file.original_filename = "#{self.product.name}_image_#{Time.now}"
    self.file = file
  end

end
