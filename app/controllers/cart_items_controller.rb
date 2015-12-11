class CartItemsController < ApplicationController
	def destroy
		@item = current_cart.find_cart_item(params[:id])
		@product = @item.product
		@item.destroy
		flash[:danger] = "成功將 #{@product.title} 從購物車刪除~!"
		redirect_to :back
	end

	def update
		@item = current_cart.find_cart_item(params[:id])
		@item.update(item_params)
		flash[:info] = "已成功變更數量"
		redirect_to :back
	end

	private

	def item_params
		params.require(:cart_item).permit(:quantity)
	end
end
