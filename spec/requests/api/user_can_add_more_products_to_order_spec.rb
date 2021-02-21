RSpec.describe 'PUT /api/orders/:id', type: :request do
  let(:test_user) { create(:user) }
  let(:auth) { test_user.create_new_auth_token }
  let(:test_order) { create(:order, user: test_user) }
  let(:ordered_product) { create(:product) }
  let(:product_to_order) { create(:product, title: 'Meatballs') }

  describe 'successfully' do
    before do
      test_order.items.create(product: ordered_product)
      put "/api/orders/#{test_order.id}",
          params: {
            order_id: test_order.id,
            product_id: product_to_order.id
          },
          headers: auth
    end

    it 'responds with a 200 status' do
      expect(response).to have_http_status 200
    end

    it 'responds with success message' do
      expect(response_json['message']).to eq 'The item was added to your order'
    end

    it 'updates the length of items array' do
      expect(response_json['order']['items'].count).to eq 2
    end

    it 'adds the right product to the items array' do
      expect(response_json['order']['items'].last['title']).to eq 'Meatballs' 
    end
  end
end
