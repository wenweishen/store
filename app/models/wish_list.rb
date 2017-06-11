# == Schema Information
#
# Table name: wish_lists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WishList < ApplicationRecord
  # 关联 #
belongs_to :product
belongs_to :user
end
