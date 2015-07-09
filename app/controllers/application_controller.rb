class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  skip_before_action :verify_authenticity_token, if: :json_request?
  force_ssl if: :ssl_configured?

  protected

  def ssl_configured?
    !Rails.env.development?
  end

  def json_request?
    # request.format.json?
    request.format = :json
  end

  # Remove the root element, curly braces surrounding the JSON.
  def default_serializer_options
    {
      root: false
    }
  end



end
