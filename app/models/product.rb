class Product < ApplicationRecord
  belongs_to :sub_category
  has_one_attached :image

  # def as_json(options = {})
  #   super(options).merge({ image_url: image.service_url })
  # end

  def as_json(options = {})
    super(options).merge({ image_url: image.url }) if image.attached?
  end
end
