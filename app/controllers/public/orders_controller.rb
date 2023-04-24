class Public::OrdersController < ApplicationController
  def show
  end

  def create

  end

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_number] == "0"
    @address = Address.find(params[:order][:addresses_id])
    @order.postcode = current_customer.postcode
    @order.address = current_customer.address
    @order.name = current_customer.last_name + first_name.current_customer

    @cart_items = CartItem.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
   # @order = Order
   # @order.postage = 800
  end

  def thanx
  end

  def index
  end

  private
    def order_params
      params.require(:order).permit(:payment_method, :postcode, :address, :name)
    end
end

# <table>
#   <thead>
#     <tr>
#       <th>送料</th>
#       <th>商品合計</th>
#       <th>請求金額</th>
#     </tr>
#   </thead>
#   <tbody>
#     <tr>
#       <td><%= @order.postage %></td>
#       <td><%= @total.round.to_s(:delimited) %></td>
#       <td><%= @order.postage+@total.round.to_s(:delimited) %></td>
#     </tr>
#   </tbody>
# </table>