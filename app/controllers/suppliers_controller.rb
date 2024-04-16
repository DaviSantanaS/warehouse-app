class SuppliersController < ApplicationController

  before_action :get_supplier, only: [:show, :edit, :update]
  def index
    @suppliers = Supplier.all
  end

  def show;  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.create(supplier_params)
    if @supplier.save
      redirect_to suppliers_path, notice: "Fornecedor cadastrado com sucesso!"
    else
      flash.now[:notice] = "Erro ao cadastrar fornecedor!"
      render 'new'
    end
  end

  def edit;  end

  def update
    if @supplier.update(supplier_params)
      redirect_to supplier_path(@supplier), notice: "Fornecedor atualizado com sucesso!"
    else
      flash.now[:notice] = "Erro ao atualizar fornecedor!"
      render 'edit'
    end
  end


  private

  def supplier_params
    params.require(:supplier).permit(:corporate_name, :brand_name, :registration_number,
                                    :full_address, :city, :state, :email)
  end

  def get_supplier
    @supplier = Supplier.find(params[:id])
  end
end
