require "rails_helper"

RSpec.describe BucketList, type: :model do
  it { should belong_to :user }
  it { should have_many :items }
  it { should validate_presence_of :name }

  describe ".search" do
    name = Faker::StarWars.character
    let!(:bucket_list) { create(:bucket_list, name: name) }
    context "when query exists" do
      it "returns the bucketlist" do
        expect(BucketList.search(name)).to include bucket_list
      end
    end
  end

  describe ".paginate" do
    let!(:bucket_lists) { create_list(:bucket_list, 50) }
    it "returns bucket lists per page" do
      per_page = 20
      page = 1
      expect(BucketList.paginate(page, per_page)).to eq(
        BucketList.limit(20).offset(1)
      )
    end
  end
end
