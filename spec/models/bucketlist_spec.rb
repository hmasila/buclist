require "rails_helper"

RSpec.describe Bucketlist, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :items }
  it { is_expected.to validate_presence_of :name }
  let!(:user) { create(:user, id: 1) }

  describe ".search" do
    name = Faker::StarWars.character
    let!(:bucketlist) { create(:bucketlist, name: name) }
    context "when query exists" do
      it "returns the bucketlist" do
        expect(Bucketlist.search(name)).to include bucketlist
      end
    end

    context "when query does not exist" do
      it "returns not found error" do
        name = Faker::Lorem.word
        expect { Bucketlist.search(name) }.
          to raise_error(ActiveRecord::RecordNotFound,
                         "Sorry, #{name} not found.")
      end
    end
  end

  describe ".paginate" do
    let!(:bucketlists) { create_list(:bucketlist, 50) }
    it "returns bucket lists per page" do
      limit = 20
      page = 1
      expect(Bucketlist.paginate(limit, page)).to eq(
        Bucketlist.limit(20).order("id ASC").offset(0)
      )
    end
  end
end
