class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:order_id, :posta_code, :prefectur_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end
