require 'rails_helper'

RSpec.describe QuizzesController, type: :controller do

  describe "GET #quiz" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
