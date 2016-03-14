require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Vaidations' do
    it { should validate_presence_of :body }
    it { should validate_presence_of :title }
    it { should validate_presence_of :author }
    it { should validate_presence_of :post_url }
    it { should validate_presence_of :meta_tags }
    it { should validate_presence_of :hero_image }
    it { should validate_presence_of :meta_title }
    it { should validate_presence_of :publish_date }
    it { should validate_presence_of :meta_description }
  end

  describe 'Relations' do
    it { should belong_to(:author).class_name('AdminUser').with_foreign_key('author_id') }
  end
end
