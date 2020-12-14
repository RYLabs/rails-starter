require 'rails_helper'

describe Api::Auth::SessionsController, type: :request do
  describe "POST /api/login" do
    let(:user) { FactoryBot.create(:user) }

    before do
      post '/api/login', params: { user: { email: user.email, password: 'Password123!' } }
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected recipe attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response).to include('email', 'id')
    end

    it 'returns JWT token in response' do
      expect(response.headers['Authorization']).to be_present
    end
  end
end