class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: [:edit]
  before_action :item_data, only: [:show, :edit, :update]
  def index
    @items = Item.includes(:user).order('created_at DESC')
    @buyer = Buyer.pluck(:item_id)
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
    @buyer = Buyer.pluck(:item_id)
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
    @item = Item.find(params[:id])
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
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
