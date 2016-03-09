require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  describe 'Vaidations' do
    it { should validate_presence_of :bio }
    it { should validate_presence_of :name }
    it { should validate_presence_of :avatar }
  end

  describe 'Relations' do
    it { should have_many(:posts) }
  end
end
