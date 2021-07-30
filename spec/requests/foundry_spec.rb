require 'rails_helper'

RSpec.describe "Foundries", type: :request do
  describe "GET /page" do
    it "returns http success" do
      get "/foundry/page"
      expect(response).to have_http_status(:success)
    end
  end

end
