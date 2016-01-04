class Admin::OrdersController < AdminController

  before_action :find_order, except: :index

  def index
    @orders = Order.all
  end

  def show
    @order_info = @order.info
    @order_items = @order.items
  end

  def deliver
  	@order.ship!
  	redirect_to :back
  end

  def shipped
  	@order.deliver!
  	redirect_to :back

  end

  def canceled
  	redirect_to :back
  	@order.cancel
  	
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
