class Brand < ApplicationRecord
  # 新增/修改栏位限制与提示 #
  validates :title, presence: true

  # 关联 #
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

  # 上传品牌 Logo 图 #
  mount_uploader :logo, ImageUploader

  # Scope #
  scope :published, -> { where(is_hidden: false) }
end
