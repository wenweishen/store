class OrderItem < ApplicationRecord
  # 关联 #
  belongs_to :order
  belongs_to :product
end
