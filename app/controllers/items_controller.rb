class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    @items = Item.includes(:user).order('created_at DESC')
    @buyers = Buyer.all
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

  def update    
  end

  private

  def item_params
    params.require(:item).permit(:name, :explain, :charge_id, :area_id, :delivery_date_id, :price, :category_id, :status_id, :image).merge(user_id: current_user.id)
  end
end
