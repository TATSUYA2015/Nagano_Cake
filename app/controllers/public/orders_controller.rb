class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
    @customers=current_customer
  end

  def create
  end

  def comfirm
  end

  def complete
  end

  def index
  end

  def show
  end
end
