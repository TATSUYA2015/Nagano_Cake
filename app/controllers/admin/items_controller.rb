class Admin::ItemsController < ApplicationController
  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    @items=Item.all
    if @item.save
      redirect_to admin_items_path(@item.id)
    else
      render new_admin_item_path
    end
  end

  def index
    @item=Item.new
    @items=Item.all
  end

  def show
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, )
  end

end
