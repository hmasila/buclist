require "rails_helper"

RSpec.describe "Bucket_list items", type: :request do
  let(:bucket) { create(:bucket_list) }
  let!(:items) { create_list(:item, 10, bucket_list: bucket) }

  describe "GET /bucket_lists/:bucket_id/items" do
    context "when authentication token is passed" do
      let!(:req) do
        get "/bucketlists/1/items", {}, HTTP_AUTHORIZATION: "token #{token_helper}",
                                                   HTTP_ACCEPT: "application/vnd.buclist.v1+json"
      end
      context "when user's bucket_list has items" do
        it "returns a success status" do
          expect(response.status).to eql 200
        end
      end
    end
  end
end
