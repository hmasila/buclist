require "rails_helper"

RSpec.describe " Show bucket_list item", type: :request do
  describe "GET #show" do
    let!(:bucket_list) { create(:bucket_list) }
    let!(:item) { create(:item) }
    let(:id) { item.id }

    context "when an authentication token is passed" do
      let!(:req) do
        get "/bucket_lists/1/items/#{id}", {}, valid_headers
      end
      context "when bucketlist item exists" do
        it_behaves_like "a http response", 200

        it "returns the item" do
          expect(json["name"]).to eq(item.name)
        end
      end
      context "when bucketlist item does not exist" do
        let(:id) { 0 }

        it_behaves_like "route not found"
      end
    end

    include_context "unauthenticated request" do
      before do
        get "/bucket_lists/1/items/#{id}", {}, invalid_headers
      end
    end
  end
end
