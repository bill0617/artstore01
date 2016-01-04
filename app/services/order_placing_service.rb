class OrderPlacingService

  def initialize(cart, order)
    @order = order
    @cart = cart
  end

  def place_order!
    @order.build_item_from_cart(@cart)
    @order.calculate_total!(@cart)
    @cart.clean_all!
    OrderMailer.notify_order_placed(@order).deliver!

  end
end