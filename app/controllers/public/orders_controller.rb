class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
    @customer=current_customer
  end

  def confirm
    @order=Order.new(order_params)
    @customer=current_customer
    @cart_items=current_customer.cart_items
    @total_price=@cart_items.sum{|cart_item|cart_item.item.with_tax_price * cart_item.amount}
    params[:order][:payment_method] = params[:order][:payment_method] ##支払方法の情報
    if params[:order][:select_address] == "0"
      @order.postal_code=current_customer.postal_code
      @order.address=current_customer.address
      @order.name=current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] =="1"
      @order.postal_code=Address.find(params[:order][:address_id]).postal_code
      @order.address=Address.find(params[:order][:address_id]).address
      @order.name=Address.find(params[:order][:address_id]).name
    elsif params[:order][:select_address] == "2"
      @address = Address.new(address_params) #変数の初期化
      @address.postal_code = params[:order][:postal_code] #newページで新しいお届け先に入力した郵便番号を取得代入
      @address.address = params[:order][:address] #newページで新しいお届け先に入力した住所を取得代入
      @address.name = params[:order][:name] #newページで新しいお届け先に入力した宛名を取得代入
      if @address.save
        @order.postal_code=@address.postal_code
        @order.address=@address.address
        @order.name=@address.name
      end
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

  def address_params
    params.permit(:address, :name, :postal_code, :customer_id)
  end

end
