require "rails_helper"

RSpec.describe "bucketlist items", type: :request do
  describe "PUT #update" do
    let(:user) { create(:user) }
    let!(:bucket) { create(:bucketlist) }
    let!(:item) { create(:item, bucketlist: bucket) }
    let(:id) { item.id }
    let(:params) { { name: "StarWars" }.to_json }

    context "when an authentication token is passed" do
      let(:headers) { valid_headers }
      let!(:req) do
        put "/bucketlists/1/items/#{id}", params, valid_headers
      end
      context "when bucketlist item exists" do
        it_behaves_like "a http response", 200

        it "updates the item" do
          updated_item = Item.find(id)
          expect(updated_item.name).to match(/StarWars/)
        end
      end
      context "when bucketlist item does not exist" do
        let(:id) { 0 }

        it_behaves_like "route not found"
      end
    end

    include_context "unauthenticated request" do
      before do
        get "/bucketlists/1/items/#{id}", params, invalid_headers
      end
    end
  end
end
