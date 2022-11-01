class Admin::ItemsController < ApplicationController
  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    @items=Item.all
  end

  def index
  end

  def show
  end

  def edit
  end

  private

  def Item_params
    params.require(:item).permit(:title, :body, :image)
  end

end
