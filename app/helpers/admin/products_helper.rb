module Admin::ProductsHelper
  # 判断产品的 Public/Hidden状态，显示对应图标
  def render_product_status(product)
    if product.is_hidden
      content_tag(:span, "", :class => "fa fa-lock fa-fw")
    else
      content_tag(:span, "", :class => "fa fa-globe fa-fw")
    end
  end

  # 判断产品是否为精选商品
  def render_product_chosen_status(product)
    if product.is_chosen
      content_tag(:span, "", :class => "fa fa-heart fa-fw")
    end
  end

  # 改变产品的Publish/Hide状态，并可以通过按钮改变
  def render_product_publish_or_hide(product)
    if product.is_hidden
      link_to(t('btn-publish'), publish_admin_product_path(product), :method => :post, :class => 'btn btn-sm btn-default')
    else
      link_to(t('btn-hide'), hide_admin_product_path(product), :method => :post, :class => 'btn btn-sm btn-default')
    end
  end
end
