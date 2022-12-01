class Admin::OrdersController < ApplicationController
  def index
    @order=Order.all
  end

  def show
    @order=Order.all
  end

  def update
  end

end
