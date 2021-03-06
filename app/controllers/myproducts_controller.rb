class MyproductsController < ProtectedController
  ##### PRIVATE #####

  def index
    @products = @current_user.products
    render json: @products
  end

  def show
    @product = @current_user.products.find(params[:id])
    render json: @product
  end

  def create
    @product = @current_user.products.new(product_params)
    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    @product = @current_user.products.find(params[:id])
    if @product.update(product_params)
      head :no_content
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product = @current_user.products.find(params[:id])
    @product.destroy
    head :no_content
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :daily_cost, :category, :image)
  end


end
