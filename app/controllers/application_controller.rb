class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception

 def admin_required
   if !current_user.admin?
     redirect_to "/", alert: "You are not admin."
   end
 end

 helper_method :current_cart

 def current_cart
   @current_cart ||= find_cart
 end

#多语言切换系统
  def set_locale
    if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
      session[:locale] = params[:locale]
    end

    I18n.locale = session[:locale] || I18n.default_locale
  end

 private

 def find_cart
   cart = Cart.find_by(id: session[:cart_id])
   if cart.blank?
     cart = Cart.create
   end
   session[:cart_id] = cart.id
   return cart
 end

  before_action :set_timezone

  def set_timezone
    if current_user && current_user.time_zone
      Time.zone = current_user.time_zone
    end
  end
end
