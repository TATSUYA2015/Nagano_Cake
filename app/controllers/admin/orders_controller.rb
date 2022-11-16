class Admin::OrdersController < ApplicationController
  def index
    @order=Order.all
  end

  def show
  end

  def update
  end

end
