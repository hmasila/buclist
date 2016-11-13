require "rails_helper"

RSpec.describe AuthenticationController, type: :controller do
  let!(:user) { create(:user) }

  describe "POST #login" do
    let(:params) do
      {
        email: user.email,
        password: user.password
      }
    end
    let!(:req) { post :login, params: params }

    context "when a user logs in" do
      it_behaves_like "a http response", 200, "Logged in successfully"

      it "returns an authentication token" do
        expect(json["auth_token"]).not_to be_nil
      end
    end

    context "when a user logs in with invalid parameters" do
      let(:params) { attributes_for(:user) }

      it_behaves_like "a http response", 401, "Invalid Credentials"
    end
  end

  describe "GET #logout", type: :request do
    let(:header) { valid_headers(user.id) }
    let!(:req) { get "/auth/logout", params: {}, headers: header }

    context "when user tries to logout" do
      it "logs out the user" do
        expect(json["message"]).to eq "Logged out successfully"
        expect(user.tokens[0].token).
          to include(header["Authorization"])
      end
    end

    context "when user is already logged out" do
      it "raises ExpiredSignature error" do
        get "/auth/logout", params: {}, headers: header
        expect(json["message"]).
          to eq "Token has expired. Please login to continue."
        expect(response).to have_http_status(401)
      end
    end

    include_context "unauthenticated request" do
    end
  end
end
