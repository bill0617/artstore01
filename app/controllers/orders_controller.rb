class OrdersController < ApplicationController

	def create
		@order = current_user.orders.build(order_params)

		if @order.save
			@order.build_item_from_cart(current_cart)
			@order.calculate_total!(current_cart)
			current_cart.clean_all!
			OrderMailer.notify_order_placed(@order).deliver!
			redirect_to order_path(@order.token)
		else
			render "carts/checkout"
		end
	end

	def show
		@order = current_user.orders.find_by_token(params[:id])
		@order_info = @order.info
		@order_items = @order.items
	end

	def pay_by_card
		@order = current_user.orders.find_by_token(params[:id])
		@order.set_payment_with!("Credit Card")
		@order.make_payment!
		redirect_to account_orders_path, notice: "已成功付完款項"
	end

	private

	def order_params
		params.require(:order).permit(info_attributes: [:billing_name,
																										:billing_address,
																										:shipping_name,
																										:shipping_address	])
	end

end
