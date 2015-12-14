class Account::MyFollowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @items = @user.item_follows
    set_page_title"我的追蹤清單"


  end

  def destroy
    @user = current_user
    @item = @user.my_follows.find_by(params[:product_id])
    @item.destroy
    redirect_to :back
  end

  def add_follows_to_cart
    @user = current_user
    @item = @user.item_follows.find(params[:id])
    if !current_cart.items.include?(@item)
    	current_cart.add_item_to_cart(@item)
    	flash[:success] = "已成功將 #{@item.title} 加進購物車！"
    else
    	flash[:warning] = "購物車已有此商品！"
    end
    redirect_to :back
  end

  def add_select_to_cart
    if !params[:product_ids].nil?
      params[:product_ids] = params[:product_ids].collect{ |i|  i.to_i }
      @items = current_user.item_follows.find(params[:product_ids])
    @items.each do |item|
      if !current_cart.items.include?(item)
        current_cart.add_item_to_cart(item)
        flash[:success] = "已成功將 #{item.title} 加進購物車！"
      else
        flash[:warning] = "購物車已有此商品！"
      end
    end
    else
    end
      redirect_to :back

  end


end
