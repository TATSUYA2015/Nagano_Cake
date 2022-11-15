class Public::AddressesController < ApplicationController
  def index
    @address=Address.new
    @addresses=Address.all
  end

  def create
    @address=Address.new(address_params)
    @address.customer_id=current_customer.id
    @addresses=Address.all
    if @address.save
      redirect_to public_addresses_path(@address.id)
    else
      render :index
    end
  end

  def edit
    @address=Address.find(params[:id])
  end

  def update
    address=Address.find(params[:id])
    address.update(address_params)
    redirect_to public_addresses_path(address.id)
  end

  def destroy
    address=Address.find(params[:id])
    address.destroy
    redirect_to public_addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end