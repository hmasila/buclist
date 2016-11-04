require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:params) { attributes_for(:user) }
  let!(:existing_user) { create(:user) }

  describe "POST #create" do
    let!(:req) { post :create, params: params }

    context "when a new user signs up" do
      it_behaves_like "a http response", 201, "Account created successfully"

      it "creates a new user" do
        expect(User.count).to eq(1)
      end

      it "returns an authentication token" do
        expect(json["auth_token"]).not_to be_nil
      end
    end

    context "when and existing user signs up" do
      let(:params) do
        {
          email: existing_user.email,
          password: existing_user.password
        }
      end

      it_behaves_like "a http response", 422, "User already exists"
    end

    context "when a new user signs up with the invalid parameters" do
      let(:params) do
        {
          email: Faker::Lorem.word,
          password: nil
        }
      end

      it_behaves_like "a http response", 422, "Account could not be created"
    end
  end
end
