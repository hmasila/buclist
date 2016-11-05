RSpec.shared_examples "route not found" do
  context "when the route does not exist" do
    it_behaves_like "a http response", 404, /Endpoint does not exist/
  end
end
