class ItemsController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to action: :index
    else
      render action: :new
    end
  end


  private
  def user_params
    params.require(:user).permit(:nickname, :last_name, :first_name, :kana_last_name, :kana_first_name, :birthday)
  end
end
