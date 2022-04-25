require 'rails_helper'

RSpec.describe 'Entities edpoint', type: :request do
  describe 'GET /entities' do
    before { get '/entities' }

    it 'should return entities' do
      body = JSON.parse(response.body)
      expect(body).to eq([])
    end

  end
end