class Admin::CustomersController < ApplicationController
  def index
    @customer=Customer.new
    @customers=Customer.all
  end

  def show
    @customer=Customer.find(params[:id])
  end

  def edit
    @customer=Customer.find(params[:id])
  end

  def update
    customer=Customer.find(params[:id])
    customer.update(customer_parmas)
    redirect_to admin_customer_path
  end

  private

  def customer_parmas
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
  end

end
