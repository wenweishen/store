class Admin::CategoriesController < ApplicationController
  layout "admin" # 后台页面排版
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @categories = Category.all
  end

  def show
    @categorie = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end


  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path, warning: "你已删除这个分类"
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
