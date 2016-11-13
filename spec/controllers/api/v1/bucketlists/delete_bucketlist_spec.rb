require "rails_helper"

RSpec.describe "Delete a bucketlist", type: :request do
  let!(:user) { create(:user, id: 1) }
  let!(:bucket) { create(:bucketlist) }
  let(:id) { bucket.id }
  let(:header) { valid_headers(user.id) }

  let!(:req) { delete "/bucketlists/#{id}", params: {}, headers: header }
  subject { response }

  context "when the bucket exists" do
    it_behaves_like "a http response", 200, "bucketlist deleted successfully"
    it "destroys the selected bucketlist" do
      expect(Bucketlist.count).to eq 0
    end
  end

  context "when the bucket does not exist" do
    let(:id) { 0 }
    it_behaves_like "a http response", 404, "Sorry, bucketlist not found."
  end

  include_context "unauthenticated request"
end
