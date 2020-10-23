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
    @item = Item.find(params[:id])
    @item_category = Category.find(@item.category_id).name
    @item_status = Status.find(@item.status_id).name
    @item_charge = Charge.find(@item.charge_id).name
    @item_area = Area.find(@item.area_id).name
    @item_delivery_date = DeliveryDate.find(@item.delivery_date_id).name
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:name, :explain, :charge_id, :area_id, :delivery_date_id, :price, :category_id, :status_id, :image).merge(user_id: current_user.id)
  end
end
