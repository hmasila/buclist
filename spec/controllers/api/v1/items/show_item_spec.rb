require "rails_helper"

RSpec.describe " Show bucketlist item", type: :request do
  describe "GET #show" do
    let!(:user) { create(:user, id: 1) }
    let!(:bucket) { create(:bucketlist, id: 1) }
    let!(:item) { create(:item) }
    let(:id) { item.id }
    let(:header) { valid_headers(user.id) }

    let!(:request) do
      get "/bucketlists/1/items/#{id}", params: {}, headers: header
    end

    context "when an authentication token is passed" do
      context "when bucketlist item exists" do
        it_behaves_like "a http response", 200

        it "returns the item" do
          expect(json["name"]).to eq item.name
          expect(json["id"]).to eq item.id
        end
      end
      context "when bucketlist item does not exist" do
        let(:id) { 0 }

        it_behaves_like "a http response", 404, "Sorry, item not found."
      end
    end

    include_context "unauthenticated request" do
    end
  end
end
