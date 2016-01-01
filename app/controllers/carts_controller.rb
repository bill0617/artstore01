class CartsController < ApplicationController

	before_action :authenticate_user!

	def checkout
		@order = current_user.orders.build
		@info = @order.build_info
	end

	def clean
		current_cart.clean_all!
		flash[:warning] = "購物車已經清空！"
		redirect_to :back
	end
	
end
