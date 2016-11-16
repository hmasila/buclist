require "rails_helper"

RSpec.describe "bucketlist items", type: :request do
  describe "PUT #update" do
    let!(:user) { create(:user, id: 1) }
    let!(:bucket) { create(:bucketlist, id: 1) }
    let!(:item) { create(:item) }
    let(:id) { item.id }
    let(:params) { { name: "StarWars" } }
    let(:header) { valid_headers(user.id) }

    let!(:request) do
      put "/bucketlists/1/items/#{id}", params: params, headers: header
    end

    context "when an authentication token is passed" do
      context "when bucketlist item exists" do
        it_behaves_like "a http response", 200

        it "updates the item" do
          updated_item = Item.find(id)
          expect(updated_item.name).to eq "StarWars"
        end

        it "returns the updated bucketlist" do
          expect(json["name"]).to eq "StarWars"
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
