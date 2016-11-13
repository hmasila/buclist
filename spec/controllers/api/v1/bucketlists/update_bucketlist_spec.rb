require "rails_helper"

RSpec.describe "Update a bucketlist", type: :request do
  let!(:user) { create(:user, id: 1) }
  let!(:bucket) { create(:bucketlist) }
  let(:id) { bucket.id }
  let(:header) { valid_headers(user.id) }
  let(:params) { { name: "updated bucketlist" } }

  let!(:req) { put "/bucketlists/#{id}", params: params, headers: header }
  subject { response }

  context "when the bucket exists" do
    context "with valid parameters" do
      it_behaves_like "a http response", 200

      it "returns the updated bucketlist" do
        expect(json["name"]).to eq "updated bucketlist"
        expect(json["created_by"]).to eq user.full_name
      end

      it "updates the bucketlist" do
        updated_bucket = Bucketlist.find(id)
        expect(updated_bucket.name).to eq "updated bucketlist"
      end
    end
  end

  context "with invalid parameters" do
    let(:params) { { name: nil } }
    it_behaves_like "a http response", 422,
                    "Validation failed: Name can't be blank"
    it "fails to update selected bucketlist" do
      expect(Bucketlist.last.name).to_not eql nil
    end
  end

  context "when the bucket does not exist" do
    let(:id) { 0 }

    it_behaves_like "a http response", 404, "Sorry, bucketlist not found."
  end

  include_context "unauthenticated request"
end
