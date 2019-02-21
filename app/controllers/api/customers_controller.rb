class Api::CustomersController < ApplicationController
  before_action :authenticate_request, except: [:create]

  # GET /api/customers
  def index
    if params[:street_name] && params[:customer_name]
      customers = Customer.filter_by_street(params[:street_name]).
                           filter_by_name(params[:customer_name])
    elsif params[:street_name]
      customers = Customer.filter_by_street(params[:street_name])
    elsif params[:customer_name]
      customers = Customer.filter_by_name(params[:customer_name])
    else
      customers = Customer.all
    end
    render json: customers
  end

  # POST /api/customers
  def create
    customer = Customer.new(customer_params)

    if customer.save
      render json: customer, status: :created
    else
      render json: customer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/customers/1
  def destroy
    customer = Customer.find_by_id(params[:id])
    if customer && customer.destroy
      render json: { message: "Deletion of customer #{customer.name} is successful" }, status: :ok
    else
      render json: customer.errors, status: :unprocessable_entity
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :address_id)
  end
end
