class OrdersController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery except: :pay2go_cc_notify

  def create
    @order = current_user.orders.build(order_params)

    if @order.save
      OrderPlacingService.new(current_cart, @order).place_order!	
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


  def pay2go_cc_notify
    @order = current_user.orders.find_by_token(params[:id])

    if params["Status"] == "SUCCESS"
      @order.set_payment_with!("Credit Card")
      @order.make_payment!
      if @order.is_paid?
        flash[:notice] = "信用卡付款成功"
        redirect_to account_orders_path
      else
        render text: "信用卡失敗"
      end
    else
      render text: "交易失敗"
    end

  end

  private

  def order_params
    params.require(:order).permit(info_attributes: [:billing_name,
                                                    :billing_address,
                                                    :shipping_name,
                                                    :shipping_address	])
  end

end
