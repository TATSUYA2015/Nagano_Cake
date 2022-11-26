class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
    @customer=current_customer
  end

  def confirm
    @order=Order.new(order_params)
    @orders=current_customer.cart_items
    @customer=current_customer
    @cart_items=current_customer.cart_items
    @total_price=@cart_items.sum{|cart_item|cart_item.item.with_tax_price * cart_item.amount}
    params[:order][:payment_method] = params[:order][:payment_method] ##支払方法の情報


    ##分岐
      if params[:order][:address] == "0"
        @order.postal_code=current_customer.postal_code
        @order.address=current_customer.address
        @order.name=current_customer.first_name + current_customer.last_name
        elsif params[:order][:address] == "1"
        @order.postal_code = Address.find(params[:order][:address]).postal_code #newページで選ばれた配送先住所idから特定して郵便番号の取得代入
        @order.address = Address.find(params[:order][:address]).address #newページで選ばれた配送先住所idから特定して住所の取得代入
        @order.name = Address.find(params[:order][:address]).name
        elsif params[:order][:address] == "2"

        else

      end

  end

  def complete
    ##注文確定画面
  end

  def create
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :customer_id, :postal_code, :address, :name)
  end

end
