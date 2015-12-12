module Admin::OrdersHelper
	def render_paid_state(order)
		if order.is_paid?
			"已付款"
		else
			"未付款"
		end
	end
end
