class AllproductsController < ProtectedController
  ##### PUBLIC #####

  def index
    @products = Product.all
    render json: @products
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
  end

  def search_products
    @products = Product.find_by_fuzzy_title(params[:title])
    render json: @products
  end

end
