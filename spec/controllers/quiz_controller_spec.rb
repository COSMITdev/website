require 'rails_helper'

RSpec.describe QuizController, type: :controller do

  describe "GET #quiz1" do
    it "returns http success" do
      get :quiz1
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #quiz2" do
    it "returns http success" do
      get :quiz2
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #quiz3" do
    it "returns http success" do
      get :quiz3
      expect(response).to have_http_status(:success)
    end
  end

end
