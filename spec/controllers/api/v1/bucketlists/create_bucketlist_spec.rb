require "rails_helper"

RSpec.describe "Create a bucketlist", type: :request do
  let(:user) { create(:user) }
  let(:params) { attributes_for(:bucketlist) }
  let(:header) { valid_headers(user.id) }

  let!(:request) { post "/bucketlists", params: params, headers: header }
  subject { response }

  context "when a bucket has valid attributes" do
    it_behaves_like "a http response", 201
    it "changes the Bucketlist model count by 1" do
      expect(Bucketlist.count).to eq 1
    end

    it "returns the created bucketlist" do
      expect(json["name"]).to eq params[:name]
    end
  end

  context "when a bucket has invalid attributes" do
    let(:params) {}

    it_behaves_like "a http response", 422,
                    "Validation failed: Name can't be blank"
  end

  include_context "unauthenticated request"
end
