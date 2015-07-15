class AllproductrentalsController < ProtectedController
  ##### PUBLIC #####

  before_action :set_product

  def index
    @rentals = @product.rentals #.sort { |a, b| [a[:date], a[:start_time]] <=> [b[:date], b[:start_time]] }
    render json: @rentals
  end

  def create
    @rental = @product.rentals.build(rental_params)
    @rental.user = @current_user
    if @rental.save
      render json: @rental, status: :created
    else
      render json: @rental.errors, status: :unprocessable_entity
    end
  end


  private

  def set_product
    # PUBLIC
    @product = Product.find(params[:allproduct_id])
  end

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :total_cost, :status, :message)
  end

end
