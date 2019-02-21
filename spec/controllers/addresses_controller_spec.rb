require "rails_helper"

describe Api::AddressesController , :type => :api do

  let!(:addresses) {   FactoryBot.create_list(:address, 4) }

  context '/index' do
    describe 'All addresses' do
      it 'return all addresses' do
        get '/api/addresses'
        expect(JSON.parse(last_response.body).count).to eql(addresses.count)
      end
    end
  end
end
