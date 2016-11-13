require "rails_helper"

RSpec.describe "List all bucketlists", type: :request do
  let(:user) { create(:user) }
  let!(:bucket) { create_list(:bucketlist, 25, user_id: user.id) }
  let(:header) { valid_headers(user.id) }

  let!(:req) { get "/bucketlists", {}, header }
  subject { response }

  context "when the user has 10 bucketlists" do
    it_behaves_like "a http response", 200
    it "returns all buckets" do
      expect(json.count).to eql 25
    end
  end

  context "when the user doesn't have any bucketlists" do
    it "returns an empty json" do
      Bucketlist.destroy_all
      expect(json.count).to eq(0)
    end
  end

  include_context "unauthenticated request"
end
