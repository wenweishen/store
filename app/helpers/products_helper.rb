module ProductsHelper
  # 币值切换
  def render_product_price(product)
    if session[:currency].present?
      @currency_s = session[:currency]
      @currency = Currency.find_by(title: @currency_s)
      product.price = product.price * @currency.rate
      price = @currency.symbol + " " + product.price.to_s
    else # 预设币值为人民币
      price = "￥" + product.price.to_s
    end
  end
end
