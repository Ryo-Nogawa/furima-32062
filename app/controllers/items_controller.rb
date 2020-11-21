class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_action, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if current_user.id == @item.user_id && @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :detail, :category_id, :item_condition_id, :item_cost_id, :delivery_area_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end

  def set_action
    @item = Item.find(params[:id])
  end
end
