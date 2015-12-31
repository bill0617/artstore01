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
			flash[:notice] = "您已將#{@product.title}加進購物車！"
		else
			flash[:warning] = "已有此商品"	
		end
		redirect_to :back
	end

end
