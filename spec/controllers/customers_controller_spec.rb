require "rails_helper"

describe Api::CustomersController , :type => :api do
  let!(:customer) { FactoryBot.create(:customer) }

  context 'GET /index' do
    describe 'authenticate request' do
      it 'request include token' do
        get '/api/customers', nil, {'HTTP_AUTH_TOKEN' => customer.auth_token}
        expect(last_response.status).to eql(200)
      end

      it 'request without token' do
        get '/api/customers'
        expect(last_response.status).to eql(401)
      end
    end

    describe "filter request" do
      it "request street filter" do
        get '/api/customers', {street_name: customer.address.street}, {'HTTP_AUTH_TOKEN' => customer.auth_token}
        filter_customers = Customer.filter_by_street(customer.address.street)
        expect(last_response.status).to eql(200)
        response = JSON.parse(last_response.body)
        expect(response.count).to eql(filter_customers.count)
      end

      it "request for name filter" do
        get '/api/customers', {customer_name: customer.name}, {'HTTP_AUTH_TOKEN' => customer.auth_token}
        filter_customers = Customer.filter_by_name(customer.name)
        expect(last_response.status).to eql(200)
        response = JSON.parse(last_response.body)
        expect(response.count).to eql(filter_customers.count)
      end

    end
  end
  context 'POST /api/customers/' do

    describe 'customer create api' do
      it 'create customer' do
        address = FactoryBot.create(:address)
        post '/api/customers', {customer: {name: 'Test name', address_id: address.id}}
        response = JSON.parse(last_response.body)
        expect(response['name']).to eql('Test name')
      end
    end
  end

  context 'DELETE /api/customers/:id' do
    describe 'remove customer api' do
      it 'remove customer' do
        customer = FactoryBot.create(:customer)
        delete "/api/customers/#{customer.id}", nil, {'HTTP_AUTH_TOKEN' => customer.auth_token}
        expect(Customer.find_by(id: customer.id)).to eql(nil)
      end
    end
  end
end
