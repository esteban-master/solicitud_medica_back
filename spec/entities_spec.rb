require 'rails_helper'

RSpec.describe 'Entities edpoint', type: :request do
  describe 'GET /entities' do
    before { get '/entities' }

    it 'should return entities' do
      body = JSON.parse(response.body)
      expect(body).to eq([])
      expect(response).to have_http_status(200)
    end
  end

  describe 'Data in the DB' do
    let!(:entities) { create_list(:entity, 5) }

    it 'should return 5 entities' do
      get '/entities'
      body = JSON.parse(response.body)
      expect(body.count).to eq(entities.count)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /entities/{id}' do
    let!(:entity) { create(:entity) }

    it 'should return 1 entity' do
      get "/entities/#{entity.id}"
      body = JSON.parse(response.body)
      expect(body).to_not be_empty
      expect(body["id"]).to eq(entity.id)
      expect(response).to have_http_status(200)
    end
  end
end

RSpec.describe Entity, type: :model do
  it { should have_many(:reviews) }
end