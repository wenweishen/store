# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  quantity    :integer
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#  is_hidden   :boolean          default(FALSE)
#  category_id :integer
#  is_chosen   :boolean          default(FALSE)
#

class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  # 新增/修改欄位限制與提示 #
  validates :title, presence: { message: "请输入商品名称" }
  validates :price, presence: { message: "请输入商品售价" }
  validates :price, numericality: { greater_than: 0, message: "请输入商品售价，必须大于零" }
  validates :quantity, presence: { message: "请输入库存数量" }, numericality: { greater_than_or_equal: 0 }
  validates :category_id, presence: { message: "请选择商品分类" }


  # 關聯 #
  belongs_to :category
  has_one :order_item

  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images

  has_many :wish_lists
  has_many :wish_list_owners, :through => :wish_lists, :source => :user



  # 商品資訊網址優化 #
  def to_param
    "#{self.id}-#{self.title.gsub(/\s+/, "")}"
  end

  # 發佈 / 隱藏 #
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  # 精選商品 #
  def chosen!
    self.is_chosen = true
    self.save
  end

  def no_chosen!
    self.is_chosen = false
    self.save
  end

  # 檢查 is_hidden 的 boolean 值 #
  def hidden?
    is_hidden
  end

  # Scope #
  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order('created_at DESC') }
  scope :random3, -> { limit(3).order('RANDOM()') }
end
