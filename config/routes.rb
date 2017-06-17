Rails.application.routes.draw do
  devise_for :users
  resource :user

#--=== 首頁 ===--#
root 'welcome#index'
# root 'products#index'

# 文章 #
resources :articles do         #文章前台
  resources :article_reviews
  member do
    post :join              #加入收藏
    post :quit              #取消收藏
  end
end

#--=== 前台 ===--#

# 商品 #
resources :products do
   member do
     post :buy_now #立即购买路径
     post :add_to_cart  #加入购物车
     post :add_to_wish_list  #收藏商品功能
     post :remove_from_wish_list #取消收藏功能
     put "like", to: "products#upvote"  #点赞功能
     post :setup_currency
   end


  # 搜索 #
  collection do
    get :search
  end
end

# 购物车 #
resources :carts do
   collection do
     delete :clean  #清空购物车
     post :checkout  #下订单
   end
end

# cart_items #
resources :cart_items

# 訂單 #
resources :orders do
      member do
        post :pay_with_alipay
        post :pay_with_wechat
        post :apply_to_cancel #申请取消订单
      end
end

#--=== 使用者专区 ===--#
namespace :account do

 # 用戶中心 #
 resources :users
 # 订单历程 #
 resources :orders
 # 收藏清单 #
 resources :products do
   member do
     post :add_to_cart
     post :remove_from_wish_list
   end
 end
end



#--=== 管理員专区 ===--#
 namespace :admin do

   # 商品 #
   resources :products do
     member do
       post :publish
       post :hide
       post :chosen
     end
   end

   # 訂單管理 #
   resources :orders do
    member do
      post :cancel
      post :ship
      post :shipped
      post :return
    end
   end

   # 類型 #
   resources :category_groups do
     member do
       post :publish
       post :hide
     end
   end
   # 分類 #
   resources :categories do
     member do
       post :publish
       post :hide
     end
   end


   # 首頁 Covers #
   resources :intros do
     member do
       post :publish
       post :hide
     end
   end
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
