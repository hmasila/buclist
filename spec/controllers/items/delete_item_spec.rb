require "rails_helper"

RSpec.describe "Delete an item", type: :request do
  describe "DELETE #destroy" do
    let(:user) { create(:user) }
    let!(:bucket) { create(:bucketlist) }
    let!(:item) { create(:item, bucketlist: bucket) }
    let(:id) { item.id }
    let(:headers) { valid_headers }

    context "when an authentication token is passed" do
      let!(:req) do
        delete "/bucketlists/1/items/#{id}", {}, headers
      end

      it_behaves_like "a http response", 204
    end

    include_context "unauthenticated request" do
      before do
        let(:headers) { headers }
        delete "/bucketlists/1/items/#{id}", {}, headers
      end
    end
  end
end
