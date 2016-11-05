require "rails_helper"

RSpec.describe "User logs in", type: :request do
  let(:user) { create(:user) }
  let(:headers) { valid_headers}
  let(:params) do
    {
      email: user.email,
      password: user.password
    }
  end
  describe "POST /auth/login" do
    let!(:req) { post "/auth/login", params, headers }

    context "when a user logs in" do
      it_behaves_like "a http response", 201, /Logged in successfully/
    end

    context "when a user logs in with invalid parameters" do
      let(:params) { attributes_for(:user) }

      it_behaves_like "a http response", 401, /Invalid credentials/
    end
  end
end
