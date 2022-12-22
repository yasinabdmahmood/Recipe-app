require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  describe 'GET /index' do
    before :each do
      get '/foods/index'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  # describe 'GET /show' do
  #   it 'returns http success' do
  #     get '/foods/show'
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
