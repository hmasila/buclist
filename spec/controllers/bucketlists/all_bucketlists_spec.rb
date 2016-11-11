require "rails_helper"

RSpec.describe "List all bucketlists", type: :request do
  let(:user) { create(:user) }
  let!(:bucket) { create_list(:bucketlist, 150, user_id: user.id) }
  let(:header) { valid_headers(user.id) }
  let(:params) {}

  let!(:req) { get "/bucketlists", params: params, headers: header }
  subject { response }

  context "without pagination params" do
    it_behaves_like "a http response", 200
    it "defaults and returns only the user's first 20 bucketlists" do
      expect(Bucketlist.count).to eq 150
      expect(json.count).to eql 20
    end
  end

  context "with invalid pagination params" do
    let(:params) { { page: -1, limit: -10 } }
    it_behaves_like "a http response", 200
    it "defaults and returns only the user's first 20 bucketlists" do
      expect(Bucketlist.count).to eq 150
      expect(json.count).to eq 20
    end
  end

  context "with pagination params and limit <= 100" do
    let(:params) { { page: 1, limit: 10 } }
    it_behaves_like "a http response", 200
    it "returns results limited by the pagination params" do
      expect(Bucketlist.count).to eq 150
      expect(json.count).to eq 10
    end
  end

  context "with pagination params and limit > 100" do
    let(:params) { { page: 1, limit: 200 } }
    it_behaves_like "a http response", 200
    it "limits bucketlists returned to the first 100 on requested page" do
      expect(Bucketlist.count).to eq 150
      expect(json.count).to eq 100
    end
  end

  context "when the user doesn't have any bucketlists" do
    before do
      Bucketlist.destroy_all
    end
    it "returns an empty json" do
      expect(json.count).to eq(0)
    end
  end

  include_context "unauthenticated request"
end
