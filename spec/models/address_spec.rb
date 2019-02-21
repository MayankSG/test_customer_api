require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:address) { FactoryBot.build(:address) }

  context "validates" do
    it 'valid address with require attributes' do
      expect(address).to be_valid
    end

    it 'validation fail without street' do
      address.street = nil

      expect(address).to_not be_valid
    end

    it 'validation fail without city' do
      address.city = nil
      expect(address).to_not be_valid
    end
  end
end
