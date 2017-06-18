class Admin::ProductsController < ApplicationController
before_action :authenticate_user! # 使用者必須登入
before_action :admin_required # 使用者必須是 admin 身份
layout "admin" # 后台页面排版

def index
 @products = Product.all.recent.paginate(:page => params[:page], :per_page => 10)
end

def show
  @product = Product.find_by_friendly_id!(params[:id])
  # 商品图片
  @product_images = @product.product_images.all
end

def new
  @product = Product.new
  # 商品多图上传
  @product_image = @product.product_images.build
  # 商品所属的分类
  #@categories = Category.all.order("category_group_id, title")
  # @categories = Category.all.map { |c| [c.title, c.id] } #这一行为加入的代码
end


def create
  @product = Product.new(product_params)

  if @product.save!
    if params[:product_images] != nil
       params[:product_images]['image'].each do |i|
        @product_image = @product.product_images.create(:image => i)
    end
  end
    redirect_to admin_products_path, alert: "添加商品成功"
  else
    render :new
  end
end


 def edit
   @product = Product.find_by_friendly_id!(params[:id])

   # 商品所属的分类
   #@categories = Category.all.map { |c| [c.title, c.id] } #这一行为加入的代码
 end

 def update
   @product = Product.find_by_friendly_id!(params[:id])
    # 商品图片
   if params[:product_images] != nil
     @product.product_images.destroy_all  #需要先删除旧图

     params[:product_images]['image'].each do |i|
       @product_image = @product.product_images.create(:image => i)
     end

    #  @product.update(product_params)
    #  redirect_to admin_products_path

   elsif @product.update(product_params)
     redirect_to admin_products_path and return
   else
     render :edit
   end

   # 產品所属的分类
   #@categories = Category.all.map { |c| [c.title, c.id] }
  # @product.category_id = params[:category_id]

   if @product.update(product_params)
     redirect_to admin_products_path
   else
     render :edit
   end
 end



 # 发布
 def publish
   @product = Product.find_by_friendly_id(params[:id])
   @product.publish!
   redirect_to :back
 end

 # 隐藏
 def hide
   @product = Product.find_by_friendly_id(params[:id])
   @product.hide!
   redirect_to :back
 end

 # 精选商品
 def chosen
   @product = Product.find_by_friendly_id(params[:id])
   if @product.is_chosen == true
     @product.no_chosen!
   else
     @product.chosen!
   end

   redirect_to :back
 end

# 删除商品
 def destroy
    @product = Product.find_by_friendly_id!(params[:id])
    @product.destroy
    flash[:alert] = "Product Deleted"
    redirect_to admin_products_path  #删除后返回后台产品列表
 end


private

def product_params
  params.require(:product).permit(:title, :description, :price, :quantity, :category_id, :is_hidden, :is_chosen, :image, :friendly_id)
end

end
