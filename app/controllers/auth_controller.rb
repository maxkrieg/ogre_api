class AuthController < ApplicationController

  def login
    credentials = login_params
    user = User.find_by email: credentials[:email]
    if user && user.authenticate(credentials[:password])
      render json: "{ \"token\": \"#{user.token}\" }"
    else
      head :bad_request
    end
  end

  def register
    @user = User.new(register_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end


  private

  def login_params
    params.require(:credentials).permit(:email, :password)
  end

  def register_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :city, :state, :zip)
  end

end
