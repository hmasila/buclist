require "rails_helper"

RSpec.describe "Create an item", type: :request do
  describe "POST #create" do
    let(:bucket) { create(:bucket_list) }
    let(:bucket_id) { 1 }
    let(:params) { { name: "StarWars" }.to_json }

    context "when user has provided the authorization code" do
      let!(:req) do
        post "/bucket_lists/#{bucket_id}/items", params, valid_headers
      end

      it_behaves_like "a http response", 201

      it "creates a bucket list item" do
        expect(json[:name]).to include("StarWars")
      end

      context "when an invalid request" do
        let!(:req) do
          post "/bucketlists/#{bucketlist_id}/items", {}, valid_headers
        end

        it_behaves_like "a http response", 422,
                        /Validation failed: Name can't be blank/
      end
    end

    context "when route not found" do
      let(:bucket_id) { 0 }
      it_behaves_like("route not found")
    end

    include_context "unauthenticated request" do
      before { post "/bucket_lists/1/items", params, invalid_headers }
    end
  end
end
