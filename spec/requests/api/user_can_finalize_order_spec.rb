RSpec.describe 'PUT /api/orders/:id', type: :request do
  let(:test_user) { create(:user) }
  let(:auth) { test_user.create_new_auth_token }
  let(:test_order) { create(:order, user: test_user) }
  let(:ordered_product1) { create(:product) }
  let(:ordered_product2) { create(:product, title: 'Meatballs') }

  describe 'successfully' do
    before do
      test_order.items.create(product: ordered_product1)
      test_order.items.create(product: ordered_product2)
      put "/api/orders/#{test_order.id}",
          params: {
            order_id: test_order.id,
            confirmed: true
          },
          headers: auth
    end

    it 'responds with 200 status' do
      expect(response).to have_http_status 200
    end

    it 'responds with correct message' do
      expect(response_json['message']).to eq 'Your order is confirmed and will be available sort of soon!'
    end

    it 'check if the order is confirmed' do
      expect(test_order.reload.confirmed?).to eq true
    end
  end
end
