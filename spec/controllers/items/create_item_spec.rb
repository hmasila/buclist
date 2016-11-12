require "rails_helper"

RSpec.describe "Create an item", type: :request do
  describe "POST #create" do
    let!(:user) { create(:user, id: 1) }
    let!(:bucket) { create(:bucketlist, id: 1) }
    let(:params) { { name: "StarWars" } }
    let(:header) { valid_headers(user.id) }

    let!(:req) do
      post "/bucketlists/1/items", params: params, headers: header
    end

    context "when an item has valid attributes" do
      it_behaves_like "a http response", 201
      it "changes the Item model count by 1" do
        expect(Item.count).to eq 1
      end

      it "returns the created item" do
        expect(json["name"]).to eq params[:name]
      end
    end

    context "when an item has invalid attributes" do
      let(:params) {}

      it_behaves_like "a http response", 422,
                      "Validation failed: Name can't be blank"
    end

    include_context "unauthenticated request"
  end
end
