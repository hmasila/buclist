require "rails_helper"

RSpec.describe "List all bucketlists", type: :request do
  let!(:user) { create(:user, id: 1) }
  let!(:bucket) { create_list(:bucketlist, 150) }
  let(:header) { valid_headers(user.id) }
  let(:params) {}

  let!(:request) { get "/bucketlists", params: params, headers: header }
  subject { response }

  context "without pagination params" do
    it_behaves_like("pagination without params", Bucketlist)
  end

  context "with invalid pagination params" do
    it_behaves_like("pagination with invalid params", Bucketlist)
  end

  context "with pagination params and limit <= 100" do
    it_behaves_like("pagination with limit <= 100", Bucketlist)
  end

  context "with pagination params and limit > 100" do
    it_behaves_like("pagination with limit > 100", Bucketlist)
  end

  context "when the queried bucket does not exist" do
    let(:queried_bucket) { create(:bucketlist, name: "queried bucket") }
    let(:params) { { q: queried_bucket.name } }
    it "returns the queried bucketlist" do
      expect(json[0]["name"]).to eq(queried_bucket.name)
    end
  end

  context "when the queried bucket does not exist" do
    let(:params) { { q: "non existent bucket" } }

    it_behaves_like "a http response", 404,
                    "Sorry, non existent bucket not found."
  end

  context "when the user doesn't have any bucketlists" do
    before do
      Bucketlist.destroy_all
      get "/bucketlists", params: params, headers: header
    end
    it "returns an empty json" do
      expect(json.count).to eq(0)
    end
  end

  include_context "unauthenticated request"
end
