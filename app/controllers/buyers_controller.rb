class BuyersController < ApplicationController
  def index
    @item = Item.includes(:user).find(params[:item_id])
    @user_purchase = UserPurchase.new
  end

  def create
    @item = Item.includes(:user).find(params[:item_id])
    @user_purchase = UserPurchase.new(purchase_params)
    if @user_purchase.valid?
      @user_purchase.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.require(:user_purchase).permit(:postal_code, :region_id, :city, :address, :building, :phone).merge(item_id: params[:item_id], user_id: @item.user_id)
  end
end
