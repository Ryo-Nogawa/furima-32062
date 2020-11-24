class OrdersController < ApplicationController
  befor_action :authenticate_user!, only: [:index, :create]

  def index
    redirect_to root_path if current_user.id == @item.user_id
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
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
    Payjp.api_key = 'sk_test_1b11a596bdd2b55fdd22d887'
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end
end
