require "rails_helper"

RSpec.describe Bucketlist, type: :model do
  it { should belong_to :user }
  it { should have_many :items }
  it { should validate_presence_of :name }

  describe ".search" do
    name = Faker::StarWars.character
    let!(:bucketlist) { create(:bucketlist, name: name) }
    context "when query exists" do
      it "returns the bucketlist" do
        expect(Bucketlist.search(name)).to include bucketlist
      end
    end
  end

  describe ".paginate" do
    let!(:bucketlists) { create_list(:bucketlist, 50) }
    it "returns bucket lists per page" do
      limit = 20
      page = 1
      expect(Bucketlist.paginate(limit, page)).to eq(
        Bucketlist.limit(20).offset(1)
      )
    end
  end
end
