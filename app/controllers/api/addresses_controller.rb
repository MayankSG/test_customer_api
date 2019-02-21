class Api::AddressesController < ApplicationController

  def index
    render json: Address.all
  end
end
