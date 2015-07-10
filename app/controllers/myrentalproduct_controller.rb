class MyrentalproductController < ApplicationController
  ##### PRIVATE #####
  before_action :set_rental

  def show
    @product = @rental.products.find(params[:id])
    render json: @product
  end

  private

  def set_rental
    # PRIVATE
    @rental = @current_user.rentals.find(params[:myrental_id])
  end

end
