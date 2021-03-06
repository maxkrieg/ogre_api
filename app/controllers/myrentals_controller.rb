class MyrentalsController < ProtectedController
  ##### PRIVATE #####

  def index
    @rentals = @current_user.rentals
    render json: @rentals
  end

  def show
    @rental = @current_user.rentals.find(params[:id])
    render json: @rental
  end

  def update
    @rental = @current_user.rentals.find(params[:id])
    if @rental.update(rental_params)
      head :no_content
    else
      render json: @rental.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @rental = @current_user.rentals.find(params[:id])
    @rental.destroy
    head :no_content
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :status, :message, :total_cost)
  end

end
