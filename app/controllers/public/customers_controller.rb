class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    if customer.update(customer_params)
      redirect_to customer
    else
      render :edit
    end

  end

  def destroy
    customer = Customer.find(params[:id])
    customer.update(is_valid: false)
    reseet_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :postcode,
      :address,
      :phone_number,
      :email
      )
  end

end
