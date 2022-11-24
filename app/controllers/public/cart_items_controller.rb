class Public::CartItemsController < ApplicationController
  def index
    @cart_items=current_customer.cart_items
    @total_price=@cart_items.sum{|cart_item|cart_item.item.with_tax_price * cart_item.amount}
  end

  def create
    @cart_item=CartItem.new(cart_item_params)
    @cart_item.customer_id=current_customer.id
    @cart_item.item_id = cart_item_params[:item_id]
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present? ##同じ商品がカートに存在する場合
      @cart_item=current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]) ##追加する商品の個数
      @cart_item.amount += params[:cart_item][:amount].to_i                                 ##既存の個数＋追加する個数
      @cart_item.save
      redirect_to cart_items_path(@customer_id)
    elsif @cart_item.save   ##同じ商品がカートに存在しない場合
      redirect_to cart_items_path(@customer_id)
    else
      render "items/show"
    end
  end

  def update
    @cart_item=CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item=CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_item=current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
