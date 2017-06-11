# == Schema Information
#
# Table name: product_images
#
#  id         :integer          not null, primary key
#  product_id :integer
#  image      :string
#  main_image :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductImage <ApplicationRecord
  # 关联 #
  belongs_to :product

  # 商品图片 #
  mount_uploader :image, ImageUploader
end
