# == Schema Information
#
# Table name: categories
#
#  id                :integer          not null, primary key
#  title             :string
#  category_group_id :integer
#  is_hidden         :boolean          default(FALSE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Category < ApplicationRecord
  # 新增/修改栏位限制与提示 #
  validates :title, presence: { message: "请输入分类名称" }
  validates :category_group_id, presence: { message: "请选择分类类型" }

  # 关联 #
  belongs_to :category_group
  has_many :products

  # 发布 / 隐藏 #
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  # 上传分类 Logo 图 #
  mount_uploader :logo, ImageUploader

  # Scope #
  scope :published, -> { where(is_hidden: false) }
end
