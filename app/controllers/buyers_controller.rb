class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  def index
    @item = Item.includes(:user).find(params[:item_id])
    @user_purchase = UserPurchase.new
  end

  def create
    @item = Item.includes(:user).find(params[:item_id])
    @user_purchase = UserPurchase.new(purchase_params)
    if @user_purchase.valid?
      pay_item
      @user_purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.require(:user_purchase).permit(:postal_code, :region_id, :city, :address, :building, :phone).merge(item_id: params[:item_id], user_id: @item.user_id, price: @item.price, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_13efc4eaab390518aead26c2"
    Payjp::Charge.create(
      amount: purchase_params[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.includes(:user).find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end
end
