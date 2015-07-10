class ProductsController < ApplicationController

  def index
    @products = Product.all.reverse
    render json: @products
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
  end

  # To be removed
  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product, status: :created, location: products_url
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # To be removed
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      head :no_content
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # To be removed
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    head :no_content
  end


  private

  def product_params
    params.require(:product).permit(:title, :description, :daily_cost, :category, :image)
  end

end
