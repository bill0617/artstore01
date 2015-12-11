class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])

    if !current_cart.items.include?(@product)
      current_cart.add_item_to_cart(@product)
      flash[:info] = "已成功將 #{@product.title} 加進購物車！"
    else
      flash[:notice] = "此商品已加進購物車！"
    end
    redirect_to :back
  end

end
