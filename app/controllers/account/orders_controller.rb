class Account::OrdersController < ApplicationController
	before_action :authenticate_user!

	def index
		@orders = current_user.orders.order("id DESC")
	end

	def create
		@order = current_user.orders.build(order_params)

		if @order.save
			@order.build_item_from_cart(current_cart)
			@order.calculate_total!(current_cart)
			current_cart.clean!
			redirect_to account_order_path(@order.token)
		else
			redirect_to 'carts/checkout'
		end
	end

	def show
		@order = current_user.orders.find_by_token(params[:id])
		@order_info = @order.info
		@order_items = @order.items
	end

	def pay_with_credit_card
		@order = current_user.orders.find_by_token(params[:id])
		@order.set_payment_with!("credit_card")
		@order.pay!
		redirect_to account_order_path(@order.token), notice: "已成功付款"
	end

	private

	def order_params
		params.require(:order).permit(info_attributes: [:billing_name, :billing_address,
																										:shipping_name, :shipping_address])
	end
end
