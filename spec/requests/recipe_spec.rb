require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/recipe/index'
      expect(response).to have_http_status(:found)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/recipe/new'
      expect(response).to have_http_status(:found)
    end
  end
end
