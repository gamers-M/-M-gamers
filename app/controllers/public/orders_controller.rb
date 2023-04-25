class Public::OrdersController < ApplicationController
  def show
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.quantity = cart_item.quantity
      @order_detail.price = cart_item.item.price
      @order_detail.save
    end
      current_customer.cart_items.destroy_all
      redirect_to orders_thanx_path
  end

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_number] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_number] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postcode = @address.postcode
      @order.address = @address.addresses
      @order.name = @address.name
    else params[:order][:address_number] == "2"
      @order.customer_id = current_customer.id
    end

    @cart_items = CartItem.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @order.postage = 800
    @order.billing_amount = @total + @order.postage
  end

  def thanx
    #@address = Address.new(address_params)
    #@order.save
  end

  def index
  end

  private
    def order_params
      params.require(:order).permit(:payment_method, :postcode, :address, :name, :postage, :billing_amount)
    end
end