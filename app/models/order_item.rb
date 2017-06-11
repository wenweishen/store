# == Schema Information
#
# Table name: order_items
#
#  id            :integer          not null, primary key
#  order_id      :integer
#  product_title :string
#  product_price :integer
#  quantity      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  product_id    :integer
#

class OrderItem < ApplicationRecord
  # 关联 #
  belongs_to :order
  belongs_to :product
end
