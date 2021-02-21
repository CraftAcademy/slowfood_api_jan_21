RSpec.describe 'GET /api/products', type: :request do
  let!(:products) { 3.times {create(:product)} }
  let!(:products1) { create(:product, category: 'starters')}

  describe 'successful category request ' do
    before do
      get '/api/products?category=mains'
    end  

    it 'respond with a 200 status' do
      expect(response).to have_http_status 200
    end

    it 'responds with correct category' do
      expect(response_json["products"][0]['category']).to eq "mains"
    end

    it 'responds with the right amount of products' do
      expect(response_json["products"].count).to eq 3
    end
  end

  describe 'successful request 2' do
    before do
      get '/api/products?category=starters'
    end  

    it 'respond with a 200 status' do
      expect(response).to have_http_status 200
    end

    it 'responds with correct category' do
      expect(response_json["products"][0]['category']).to eq "starters"
    end

    it 'responds with the right amount of products' do
      expect(response_json["products"].count).to eq 1
    end
  end
end