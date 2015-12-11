class CartsController < ApplicationController
  before_action :authenticate_user!

  def checkout
    @order = current_user.orders.build
    @info = @order.build_info
  end

  def clean
  	if current_cart.cart_items.present?
	    current_cart.clean!
	    flash[:notice] = "已清空購物車！"
	  else
	  	flash[:warning] = "購物車本來就是空的喔！"
	  end
    redirect_to :back
  end
end

