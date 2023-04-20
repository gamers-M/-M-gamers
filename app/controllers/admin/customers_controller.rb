class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Custermer.find(parmas[:id])
  end
    
  def edit
    @customer = Custermer.find(parmas[:id])
  end

  def update
    @customer = Custermer.find(params[:id])
    if @customer.update(custermer_params)
      redirect_to admin_customer_path(@custermer.id)
    else
      render :edit
    end
  end
  
  private

  def custermer_params
    params.require(:custermer).permit(:email, :last_name, :first_name,
    :last_name_kana, :first_name_kana, :postcode, :address,
    :phone_number, :is_deleted
    )
  end
end
