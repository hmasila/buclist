require "rails_helper"

RSpec.describe "Update a bucket_list", type: :request do
  let(:user) { create(:user) }
  let!(:bucket) { create(:bucket_list, user_id: user.id) }
  let(:id) { bucket.id }
  let(:header) { valid_headers }

  let!(:req) { delete "/bucket_lists/#{id}", {}, header }
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
