class ProductrentalsController < ProtectedController

  before_action :set_product

  def index
    @rentals = @product.rentals #.sort { |a, b| [a[:date], a[:start_time]] <=> [b[:date], b[:start_time]] }
    render json: @rentals
  end

  def show
    @rental = @product.rentals.find(params[:id])
    render json: @rental
  end

  def create
    @rental = @product.rentals.build(rental_params)
    if @rental.save
      render json: @rental, status: :created
    else
      render json: @rental.errors, status: :unprocessable_entity
    end
  end

  def update
    @rental = @product.rentals.find(params[:id])
    if @rental.update(rental_params)
      head :no_content
    else
      render json: @rental.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @rental = @product.rentals.find(params[:id])
    @rental.destroy
    head :no_content
  end


  private

  def set_product
    # @product = Product.find(params[:product])
    @product = @current_user.products.find(params[:product_id])
  end

  def rental_params
    params.permit(:title,:location,:date,:start_time,:end_time,:attendees,:desc,:image)
  end

end
