class WarehousesController < ApplicationController

  def show
    @warehouse = Warehouse.find(params[:id])
  end

  def new
    # @warehouse = Warehouse.new
  end


  def create
    @warehouse = Warehouse.create(warehouse_params)
    if @warehouse.save
      redirect_to root_path
    else
      render :new
    end

  end

  def warehouse_params
    params.require(:warehouse).permit(:name, :address, :city, :state, :cep,
                                      :area, :description, :code)
  end
end