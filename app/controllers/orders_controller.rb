class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_action, only: [:index, :create]
  before_action :redirect_index, only: :index


  def index
    @order_address = OrderAddress.new
    # if current_user.id == @item.user_id && @item.order != nil
    # if @item.order != nil && current_user.id == @item.user_id
    if @item.order != nil
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      @order_address.save
      pay_item
      redirect_to root_path
    else
      # redirect_to item_orders_path(params[:item_id])
      render action: :index
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:postal_code, :prefectual_id, :city, :house_number, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end

  def set_action
    @item = Item.find(params[:item_id])
  end

  def redirect_index
    current_user.id == @item.user_id
  end
end
