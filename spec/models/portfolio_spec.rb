require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :logo }
    it { should validate_presence_of :cover }
    it { should validate_presence_of :title }
    it { should validate_presence_of :body }
    it { should validate_presence_of :working_time }
    it { should validate_presence_of :working_time_type }
  end

  describe 'Relations' do
    it { should have_many(:portfolio_photos).dependent(:destroy) }
  end
end
