class BuyersController < ApplicationController
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
      redirect_to action: :index
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.require(:user_purchase).permit(:postal_code, :region_id, :city, :address, :building, :phone, :price).merge(item_id: params[:item_id], user_id: @item.user_id, price: @item.price, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_13efc4eaab390518aead26c2"
    Payjp::Charge.create(
      amount: purchase_params[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
