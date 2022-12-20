require 'rails_helper'

RSpec.describe 'Demos', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/demo/index'
      expect(response).to have_http_status(:success)
    end
  end
end
