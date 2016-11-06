require "rails_helper"

RSpec.describe "Create an item", type: :request do
  describe "POST #create" do
    let(:user) { create(:user) }
    let(:bucket) { create(:bucket_list) }
    let(:bucket_id) { 1 }
    let(:params) { { name: "StarWars", bucket_list: bucket }.to_json }
    let(:headers) { valid_headers }

    context "when user has provided the authorization code" do
      let!(:req) do
        post "/bucket_lists/#{bucket_id}/items", params, headers
      end

      it_behaves_like "a http response", 201

      it "creates a bucket list item" do
        expect(json[:name]).to include("StarWars")
      end

      context "when an invalid request" do
        let(:params) {}
        it_behaves_like "a http response", 422,
                        "Validation failed: Name can't be blank"
      end

      context "when route not found" do
        let(:bucket_id) { 0 }
        it_behaves_like("route not found")
      end
    end

    include_context "unauthenticated request"
  end
end
