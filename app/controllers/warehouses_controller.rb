class WarehousesController < ApplicationController

  def show
    @warehouse = Warehouse.find(params[:id])
  end

  def new
    @warehouse = Warehouse.new
  end


  def create
    @warehouse = Warehouse.create(warehouse_params)
    if @warehouse.save
      redirect_to root_path, notice: "Galpão cadastrado com sucesso!"
    else
      flash.now[:notice] = "Erro ao cadastrar galpão!"
      render 'new'
    end
  end

  def edit
    @warehouse = Warehouse.find(params[:id])
  end

  def update
    @warehouse = Warehouse.find(params[:id])
    if @warehouse.update(warehouse_params)
      redirect_to root_path, notice: "Galpão atualizado com sucesso!"
    else
      flash.now[:notice] = "Erro ao atualizar galpão!"
      render 'edit'
    end
  end

  def warehouse_params
    params.require(:warehouse).permit(:name, :address, :city, :cep,
                                      :area, :description, :code)
  end
end