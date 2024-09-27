class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

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
      Rails.logger.info "Produto criado com sucesso: #{@product.inspect}"
      redirect_to products_url, notice: 'Produto criado com sucesso.'
    else 
      Rails.logger.warn "Falha ao criar produto: #{@product.errors.full_messages.join(', ')}"
      render :new, status: :unprocessable_entity
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
