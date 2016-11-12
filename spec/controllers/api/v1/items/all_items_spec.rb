require "rails_helper"

RSpec.describe "bucketlist items", type: :request do
  describe "GET #index" do
    let!(:user) { create(:user, id: 1) }
    let!(:bucket) { create(:bucketlist, id: 1) }
    let!(:items) { create_list(:item, 150) }
    let(:header) { valid_headers(user.id) }
    let(:params) {}

    let!(:req) { get "/bucketlists/1/items", params: params, headers: header }
    context "without pagination params" do
      it_behaves_like("pagination without params", Item)
    end

    context "with invalid pagination params" do
      it_behaves_like("pagination with invalid params", Item)
    end

    context "with pagination params and limit <= 100" do
      it_behaves_like("pagination with limit <= 100", Item)
    end

    context "with pagination params and limit > 100" do
      it_behaves_like("pagination with limit > 100", Item)
    end

    context "when the user doesn't have any bucketlists" do
      before do
        Item.destroy_all
        get "/bucketlists/1/items", params: params, headers: header
      end
      it "returns an empty json" do
        expect(json.count).to eq(0)
      end
    end

    include_context "unauthenticated request"
  end
end
