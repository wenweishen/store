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

  # 新增/修改栏位限制与提示 #
  validates :title, presence: { message: "请输入商品名称" }
  validates :category_id, presence: { message: "请选择商品分类" }
  validates :price, presence: { message: "请输入商品售价" }
  validates :price, numericality: { greater_than: 0, message: "请输入商品售价，必须大于零" }
  validates :quantity, presence: { message: "请输入库存数量" }, numericality: { greater_than_or_equal: 0 }


  #Product 改成可以自订 Model 网址
  before_validation :generate_friendly_id, :on => :create
  validates_presence_of :title, :friendly_id
  validates_uniqueness_of :friendly_id
  validates_format_of :friendly_id, :with => /\A[a-z0-9\-]+\z/

  # 关联 #

  has_one :order_item
  belongs_to :category

  has_many :product_images, dependent: :destroy # 多图上传 #
  accepts_nested_attributes_for :product_images # 多图上传 #

  has_many :wish_lists
  has_many :wish_list_owners, :through => :wish_lists, :source => :user

  # 商品资讯网址优化#
  # def to_param
  #   "#{self.id}-#{self.title.gsub(/\s/, "")}"
  # end

  def to_param
   self.friendly_id
  end


  # 发布 / 隐藏 #
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  # 精选商品 #
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

  protected

  def generate_friendly_id
    self.friendly_id ||= SecureRandom.uuid
  end


end
