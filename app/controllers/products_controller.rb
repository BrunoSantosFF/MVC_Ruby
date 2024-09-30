class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_url, notice: 'Produto criado com sucesso.'
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit 
  end 

  def update
    if @product.update(product_params)
      redirect_to products_url(@product), notice: 'Produto criado com sucesso.'
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      redirect_to products_url, notice: 'Produto deletado com sucesso.'
    else 
      redirect_to @product, alert: 'Erro ao tentar deletar o produto.'  # Adicionei mensagem de erro
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :quantidade, :price)
  end

end
