class Admin::OrdersController < ApplicationController
 before_action :if_not_admin
  def index
    @orders = Order.all.where.not(order_status:0)

  end

  def show
    @order = Order.find(params[:id])
    @order.freight = 800
    # @order=Order.all
    @ordered_products = OrderedProduct.where(order_id: @order)
  end

  def update
     @order = Order.find(params[:id])
     if @order.update(order_params)
       redirect_to admin_order_path(@order.id)
     else
       render :show
     end
  end

  private
   def order_params
   params.require(:order).permit(:order_status)
   end

 def if_not_admin
   redirect_to admin_session_path unless admin_signed_in?
 end
end