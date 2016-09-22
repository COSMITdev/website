require 'rails_helper'

RSpec.describe PreSaleCustomerPage, type: :model do
  describe 'Vaidations' do
    it { should validate_presence_of :slug }
    it { should validate_presence_of :video }
  end

  describe 'Relations' do
  end
end
