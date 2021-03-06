class ProductsController < ApplicationController
#  before_action :authenticate_user!, only: [:add_to_wish_list, :remove_from_wish_list]
#  before_action :validate_search_key, only: [:search]


 def index
   @products = Product.all

   # 判断是否筛选分类
   if params[:category].present?
     @category_s = params[:category]
     @category = Category.find_by(title: @category_s)
     @products = Product.where(:category => @category.id).published.recent.paginate(:page => params[:page], :per_page => 12)

   # 判断是否是精选商品
   # elsif params[:chosen].present?
   #  @products = Product.where(:is_chosen => true).published.recent.paginate(:page => params[:page], :per_page => 12)

   # 预设显示所有公开商品
   else
     @products = Product.published.recent.paginate(:page => params[:page], :per_page => 12)
   end
 end

def show
  @product = Product.find_by_friendly_id!(params[:id])
  @product_images = @product.product_images.all
  @orderSum = OrderItem.where("product_id" => @product.id).sum(:quantity)
  @product_stock = @product.quantity - @orderSum


  # 類型 / 幣值
  #@category_groups = CategoryGroup.published
  @currencies = Currency.all

  # set_page_title       @product.title
  # set_page_description @product.description
  # set_page_keywords    @product.title
  # set_page_image       @product_images.first.image.main.url
end

# 设定币值
def setup_currency
  set_currency
  redirect_to :back
end

# 加入购物车
def add_to_cart
  @product = Product.find(params[:id])
  if !current_cart.products.include?(@product)
  current_cart.add_product_to_cart(@product)
  flash[:notice] = "你已成功将 #{@product.title} 加入购物车"
     else
       flash[:warning] = "你的购物车内已有此物品"
     end
     redirect_to :back
end

# 將该商品加入愿望清单
def add_to_wish_list
  @product = Product.find(params[:id])
  if !current_user.is_wish_list_owner_of?(@product)
    current_user.add_to_wish_list!(@product)
  end
  redirect_to :back
end

# 从愿望清单上删除该商品
def remove_from_wish_list
  @product = Product.find(params[:id])
  if current_user.is_wish_list_owner_of?(@product)
    current_user.remove_from_wish_list!(@product)
  end
  redirect_to :back
end

# 删除商品
def destroy
  @product = Product.find(params[:id])
  @product.destroy
  flash[:alert] = "Product Deleted"
  redirect_to admin_products_path
end

end
