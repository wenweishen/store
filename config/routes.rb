Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations" }


#--=== 首頁 ===--#
root 'welcome#index'
# root 'products#index'


#--=== 前台 ===--#

# 商品 #
resources :products do
   member do
     post :add_to_cart
     post :add_to_wish_list
     post :remove_from_wish_list
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

   # 品牌 #

   # 類型 #

   # 分類 #



   # 首頁 Covers #

 end














  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
