require "rails_helper"

RSpec.describe "Delete an item", type: :request do
  describe "DELETE #destroy" do
    let(:user) { create(:user) }
    let!(:bucket) { create(:bucket_list) }
    let!(:item) { create(:item, bucket_list: bucket) }
    let(:id) { item.id }
    let(:headers) { valid_headers }

    context "when an authentication token is passed" do
      let!(:req) do
        delete "/bucket_lists/1/items/#{id}", {}, headers
      end

      it_behaves_like "a http response", 204
    end

    include_context "unauthenticated request" do
      before do
        let(:headers) { headers }
        delete "/bucket_lists/1/items/#{id}", {}, headers
      end
    end
  end
end
