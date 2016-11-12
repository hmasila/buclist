RSpec.shared_context "unauthenticated request" do
  context "when user does not have a valid token" do
    let(:header) { headers }
    it_behaves_like "a http response", 401, "Invalid token"
  end
end
