# == Schema Information
#
# Table name: category_groups
#
#  id         :integer          not null, primary key
#  title      :string
#  is_hidden  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CategoryGroup < ApplicationRecord
  # 新增/修改栏位限制与提示 #
  validates :title, presence: true

  # 关联 #
  has_many :categories

  #档案上传 #
#  mount_uploader :image, GroupUploader

  # 发布 / 隐藏 #
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  # 长传类型 Logo 图 #
  mount_uploader :logo, ImageUploader

  # Scope #
  scope :published, -> { where(is_hidden: false) }
#
end
