RSpec.describe 'POST /api/orders', type: :request do
  let!(:user) { create(:user) }
  let!(:auth) { user.create_new_auth_token }
  let(:test_product) { create(:product) }

  describe 'successful request ' do
    before do
      post '/api/orders',
           params: {
             product_id: test_product.id
           },
           headers: auth
    end

    it 'responds with a 201 status' do
      expect(response).to have_http_status 201
    end

    it 'responds with success message' do
      expect(response_json['message']).to eq 'The item was added to your order'
    end

    it 'responds with order containing items as an array with only 1 element' do
      expect(response_json['order']['items'].count).to eq 1
    end

    it 'response contains an order id' do
      expect(response_json['order']['id']).to be_truthy
    end

    describe 'unauthenticated request' do
      before do
        post '/api/orders',
             params: {
               product_id: test_product.id
             }
      end

      it 'responds with a 401' do
        expect(response).to have_http_status 401
      end
    end
  end
end
