require "rails_helper"

RSpec.describe "Delete an item", type: :request do
  describe "DELETE #destroy" do
    let!(:bucket_list) { create(:bucket_list) }
    let!(:item) { create(:item) }
    let(:id) { item.id }

    context "when an authentication token is passed" do
      let!(:req) do
        delete "/bucket_lists/1/items/#{id}", {}, valid_headers
      end

      it_behaves_like "a http response", 204
    end

    include_context "unauthenticated request" do
      before do
        delete "/bucket_lists/1/items/#{id}", {}, invalid_headers
      end
    end
  end
end
