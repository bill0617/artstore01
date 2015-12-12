class Admin::OrdersController < ApplicationController
	layout 'admin'

  before_action :authenticate_user!
  before_action :admin_required
  before_action :find_order, only: [:ship, :cancel, :shipped, :return, :show]
  
  def index
  	@orders = Order.order("id DESC")
  end

  def show
  	@order = Order.find(params[:id])
  	@order_info = @order.info
  	@order_items = @order.items
  end

  def cancel
    @order = Order.find(params[:id])

    @order.cancel!
    redirect_to :back
  end

  def ship
    @order.ship!
    redirect_to :back
  end

  def shipped
    @order.deliver!
    redirect_to :back
  end

  def return
    @order.return!
    redirect_to :back
  end


  private

  def find_order
    @order = Order.find(params[:id])
  end

end

 