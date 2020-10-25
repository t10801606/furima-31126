class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: [:edit]
  before_action :item_data, only: [:show, :edit, :update, :destroy]
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

  def edit
  end

  def update
    if item_data.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    item_data.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :explain, :charge_id, :area_id, :delivery_date_id, :price, :category_id, :status_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    redirect_to action: :index unless current_user.id == @item.user_id
  end

  def item_data
    @item = Item.find(params[:id])
  end
end
