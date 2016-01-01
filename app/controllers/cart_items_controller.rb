class CartItemsController < ApplicationController

	def destroy
		@cart = current_cart
		@item = @cart.find_cart_item(params[:id])
		@item.destroy
		flash[:success] = "已將#{@item.product.title}從購物車刪除囉！"
		redirect_to :back
	end

	def update
		@cart = current_cart
		@item = @cart.find_cart_item(params[:id])
		if @item.update(item_params)
			flash[:info] = "已成功變更數量！"
			redirect_to carts_path
		end
	end

	private

	def item_params
		params.require(:cart_item).permit(:quantity)
	end


end
