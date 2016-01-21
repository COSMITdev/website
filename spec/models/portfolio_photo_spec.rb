require 'rails_helper'

RSpec.describe PortfolioPhoto, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :portfolio_id }
    it { should validate_presence_of :description }
    it { should validate_presence_of :photo }
  end

  describe 'Relations' do
    it { should belong_to(:portfolio) }
  end
end
