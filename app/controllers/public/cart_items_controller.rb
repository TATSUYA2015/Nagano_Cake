class Public::CartItemsController < ApplicationController
  def index
    @cart_item=CartItem.new
    @cart_items=current_customer.id
  end

  def create
    @cart_item=CartItem.new(cart_item_params)
    @cart_item.customer_id=current_customer.id
    @cart_item.item_id = cart_item_params[:item_id]
    if @cart_item.save
      redirect_to public_cart_items_path(@customer_id)
    else
      render "public/items/show"
    end
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
