RSpec.shared_context "unauthenticated request" do
  context "when user does not have a valid token" do
    it_behaves_like "a http response", 401, "Invalid Token"
  end
end
