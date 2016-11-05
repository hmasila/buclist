require "rails_helper"

RSpec.describe "Create a bucket_list", type: :request do
  let(:user) { create(:user) }
  let(:bucket) { create(:bucket_list) }
  let(:params) { attributes_for(:bucket_list) }
  let(:header) { valid_headers }

  let!(:req) { post "/bucket_lists", params, header }
  subject { response }

  context "when a bucket has valid attributes" do
    it_behaves_like "a http response", 201, "bucket"
  end

  context "when a bucket has invalid attributes" do
    let(:params) {}

    it_behaves_like "a http response", 422,
                    "Validation failed: Name can't be blank"
  end

  include_context "unauthenticated request"
end
