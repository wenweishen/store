class WishList < ApplicationRecord
  # 关联 #
belongs_to :product
belongs_to :user
end
