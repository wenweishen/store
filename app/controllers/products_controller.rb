class ProductsController < ApplicationController
   def index
     # 商品类型/品牌
     #@products = Product.all
     @category_groups = CategoryGroup.published
     @brands = Brand.published

     # 判斷是否篩選分類
     if params[:category].present?
       @category_s = params[:category]
       @category = Category.find_by(name: @category_s)

       @products = Product.where(:category => @category.id).published.recent.paginate(:page => params[:page], :per_page => 12)

     # 判斷是否篩選類型
     elsif params[:group].present?
       @group_s = params[:group]
       @group = CategoryGroup.find_by(name: @group_s)

       @products = Product.joins(:category).where("categories.category_group_id" => @group.id).published.recent.paginate(:page => params[:page], :per_page => 12)

     # 判斷是否篩選品牌
     elsif params[:brand].present?
       @brand_s = params[:brand]
       @brand = Brand.find_by(name: @brand_s)

       @products = Product.where(:brand => @brand.id).published.recent.paginate(:page => params[:page], :per_page => 12)

     # 判斷是否選擇精選商品
     elsif params[:chosen].present?
       @products = Product.where(:is_chosen => true).published.recent.paginate(:page => params[:page], :per_page => 12)

     # 預設顯示所有公開商品
     else
       @products = Product.published.recent.paginate(:page => params[:page], :per_page => 12)
     end

   end





  def show
    @product = Product.find(params[:id])
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


end
