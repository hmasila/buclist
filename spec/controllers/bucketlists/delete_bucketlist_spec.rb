require "rails_helper"

RSpec.describe "Delete a bucketlist", type: :request do
  let(:user) { create(:user) }
  let!(:bucket) { create(:bucketlist, user_id: user.id) }
  let(:id) { bucket.id }
  let(:header) { valid_headers(user.id) }

  let!(:req) { delete "/bucketlists/#{id}", {}, header }
  subject { response }

  context "when the bucket exists" do
    it_behaves_like "a http response", 204
  end

  context "when the bucket does not exist" do
    let(:id) { 0 }

    it_behaves_like "a http response", 404, "errors"
  end

  include_context "unauthenticated request"
end
