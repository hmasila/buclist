require "rails_helper"

RSpec.describe "Delete an item", type: :request do
  describe "DELETE #destroy" do
    let!(:user) { create(:user, id: 1) }
    let!(:bucket) { create(:bucketlist, id: 1) }
    let!(:item) { create(:item) }
    let(:id) { item.id }
    let(:header) { valid_headers(user.id) }

    let!(:request) do
      delete "/bucketlists/1/items/#{id}", params: {}, headers: header
    end

    context "when the item exists" do
      it_behaves_like "a http response", 200, "item deleted successfully"
      it "destroys the selected item" do
        expect(Item.count).to eq 0
      end
    end

    context "when the item does not exist" do
      let(:id) { 0 }
      it_behaves_like "a http response", 404, "Sorry, item not found."
    end

    include_context "unauthenticated request"
  end
end
