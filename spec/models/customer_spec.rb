require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) { FactoryBot.build(:customer) }

  context "associations" do
    it { should belong_to(:address) }
  end

  context "validates" do
    it 'valid customer with all attributes' do
      expect(customer).to be_valid
    end

    it 'not valid without name' do
      customer.name = nil
      expect(customer).to_not be_valid
    end
  end

  context "filters" do
    let(:customers) { FactoryBot.create_list(:customer, 4) }
    describe 'filter by name' do
      it 'filter customer for given name' do
        customer = FactoryBot.create(:customer)
        customers = Customer.filter_by_name(customer.name)
        expect(customers).to include(customer)
      end
    end

    describe 'filter by street' do
      it 'filter customer for given street' do
        customer = FactoryBot.create(:customer)
        customers = Customer.filter_by_street(customer.address.street)
        expect(customers).to include(customer)
      end
    end
  end
end
