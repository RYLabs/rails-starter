# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Subscription', type: :request do
  subject(:user) { FactoryBot.create(:user) }

  describe 'GET /new' do
    it 'returns http success' do
      sign_in user
      get '/subscription/new'
      expect(response).to have_http_status(:success)
    end
  end
end
