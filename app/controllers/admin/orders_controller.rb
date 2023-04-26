class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    if @order.update(order_params)
      @order_details.update_all(making_status: 1) if @order.status == "payment_confirmation"
    end
    redirect_to admin_order_path(@order)
    # @order_details = @order.order_details
    # @order_details.update(order_detail_params)
  end

  private

  def order_params
      params.require(:order).permit(:status)
  end

  def order_detail_params
      params.require(:order_detail).permit(:making_status)
  end
end
