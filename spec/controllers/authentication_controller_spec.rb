require "rails_helper"

RSpec.describe AuthenticationController, type: :controller do
  let(:user) { create(:user) }
  let(:params) do
    {
      email: user.email,
      password: user.password
    }
  end
  describe "POST #login" do
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
end
