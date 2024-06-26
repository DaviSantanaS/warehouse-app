class ProductModelsController < ApplicationController

  before_action :authenticate_user!, only: [:index]

  def index
    @product_models = ProductModel.all    
  end

  def new
    @product_model = ProductModel.new
    @suppliers = Supplier.all
  end

  def create
    @product_model = ProductModel.create(product_model_params)
    if @product_model.save
      flash[:notice] = 'Modelo de produto cadastrado com sucesso'
      redirect_to @product_model
    else
      @suppliers = Supplier.all
      flash.now[:notice] = 'Não foi possível cadastrar o modelo de produto'
      render :new
    end
  end

  def show
    @product_model = ProductModel.find(params[:id])
  end

  private
  def product_model_params
    params.require(:product_model).permit(:name, :weight, :height, :width, :length, :sku, :supplier_id)
  end


end
