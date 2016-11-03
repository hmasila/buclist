RSpec.shared_context "unauthenticated request" do
  context "when user does not have a valid token" do
    it "returns an authorization error response" do
      expect(response.status).to be(401)
    end
  end
end
