class Category < ApplicationRecord
  validates :title, presence: { message: "请输入分类名称" }
  has_many :products
end
