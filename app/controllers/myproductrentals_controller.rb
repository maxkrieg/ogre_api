class MyproductrentalsController < ProtectedController
  ##### PRIVATE #####
  before_action :set_product

  def index
    @rentals = @product.rentals
    render json: @rentals
  end

  def show
    @rental = @product.rentals.find(params[:id])
    render json: @rental
  end

  def update
    @rental = @product.rentals.find(params[:id])
    if @rental.update(rental_params)
      head :no_content
    else
      render json: @rental.errors, status: :unprocessable_entity
    end
  end

  private

  def set_product
    # PRIVATE
    @product = @current_user.products.find(params[:myproduct_id])

  end

  def rental_params
    params.permit(:title,:location,:date,:start_time,:end_time,:attendees,:desc,:image)
  end

end
