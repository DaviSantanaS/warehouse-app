class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = Order.new
    @warehouses = Warehouse.all
    @suppliers = Supplier.all
    @product_models = ProductModel.all
  end

  def create
    @user = current_user
    @order = Order.create!(order_params.merge(user: @user))
    if @order.save
      redirect_to @order, notice: 'Pedido cadastrado com sucesso'
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end



  private
  def order_params
    params.require(:order).permit(:estimated_delivery_date, :warehouse_id, :supplier_id, :user_id)
  end
end
