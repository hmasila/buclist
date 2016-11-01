require "rails_helper"

RSpec.describe "Items requests", type: :request do
  let!(:user) { create(:user) }
  let!(:bucket_list) { create(:bucket_list, user_id: user.id) }
  let!(:items) { create_list(:item, 10, bucket_list_id: bucket_list.id) }
  let(:item_id) { items.last.id }
  # let!(:headers) { valid_headers }
  # let!(:invalid_headers) { invalid_headers }
  let(:bucket_id) { bucket_list.id }

  describe "GET /bucket_lists/:bucket_id/items" do
    context "when authentication token is passed" do
      let!(:req) do
        get "/bucketlists/#{bucket_id}/items", {}, HTTP_AUTHORIZATION: "token #{token_helper}",
                                                   HTTP_ACCEPT: "application/vnd.buclist.v1+json"
      end
      context "when user's bucket_list has items" do
        it "returns a success status" do
          expect(response.status).to eql 200
        end
      end
    end
  end

  describe "GET /bucket_lists/:bucket_id/items/:item_id" do
  end

  describe "POST /bucket_lists/:bucket_id/items" do
  end

  describe "POST /bucket_lists/:bucket_id/items" do
  end

  describe "PUT /bucket_lists/:bucket_id/items/:item_id" do
  end

  describe "DELETE /bucket_lists/:bucket_id/items/:item_id" do
  end
end
