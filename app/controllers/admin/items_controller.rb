class Admin::ItemsController < ApplicationController
  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    @items=Item.all
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      render new_admin_item_path
    end
  end

  def index
    @item=Item.new
    @items=Item.all
  end

  def show
    @item=Item.find(params[:id])
  end

  def edit
    @item=Item.find(params[:id])
  end

  def update
    item=Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item.id)
  end

  private

  def item_params
    params.require(:item).permit(:is_active, :name, :introduction, :image, :price, :genre_id)
  end

end
