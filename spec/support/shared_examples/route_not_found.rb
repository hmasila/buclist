RSpec.shared_examples "route not found" do |verb, route|
  before do
    send(verb, route)
  end

  context "when the route does not exist" do
    it "returns a 404 response status" do
      expect(response.status).to eq(404)
    end

    it "responds with error" do
      expect(json[:error]).to eq(endpoint_not_exist_message)
    end
  end
end
