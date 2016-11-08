require "rails_helper"

RSpec.describe "bucketlist items", type: :request do
  describe "GET #index" do
    let(:user) { create(:user) }
    let(:bucket) { create(:bucketlist) }
    let!(:items) { create_list(:item, 10, bucketlist: bucket) }
    let(:bucket_id) { 1 }
    let(:headers) { valid_headers }

    context "when authentication token is passed" do
      let!(:req) { get "/bucketlists/#{bucket_id}/items", {}, headers }
      context "when user's bucketlist has items" do
        it_behaves_like "a http response", 200
        it "retrieves all items for bucket list" do
          expect(json.count).to eq(10)
          expect(json[0][:name]).to eq(item[0].name)
        end
      end
      context "when bucketlist has no items" do
        it "returns an empty json" do
          Item.destroy_all
          expect(json.count).to eq(0)
        end
      end

      context "when bucketlist does not exist" do
        let(:bucket_id) { 0 }
        it_behaves_like("route not found")
      end
    end

    include_context "unauthenticated request" do
      let(:headers) { headers }
      before { get "/bucketlists/#{bucket_id}/items", {}, headers }
    end
  end
end
