class WarehousesController < ApplicationController

  before_action :set_warehouse, only: [:show, :edit, :update, :destroy]

  def show; end

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

  def edit; end

  def update
    if @warehouse.update(warehouse_params)
      redirect_to root_path, notice: "Galpão atualizado com sucesso!"
    else
      flash.now[:notice] = "Erro ao atualizar galpão!"
      render 'edit'
    end
  end



  def destroy
    if @warehouse.destroy
      redirect_to root_path, notice: "Galpão removido com sucesso!"
    else
      render 'show'
    end
  end

  private
  def warehouse_params
    params.require(:warehouse).permit(:name, :address, :city, :cep,
                                      :area, :description, :code)
  end
  def set_warehouse
    @warehouse = Warehouse.find(params[:id])
  end
end