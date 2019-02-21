class ApplicationController < ActionController::API

  def authenticate_request
    customer = Customer.find_by_auth_token(request.headers['HTTP_AUTH_TOKEN'])
    if customer.blank?
      render json: { errors: "Invalid token" }, status: :unauthorized
    end
  end
end
