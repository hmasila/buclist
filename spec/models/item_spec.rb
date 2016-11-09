require "rails_helper"

RSpec.describe Item, type: :model do
  it { is_expected.to belong_to(:bucketlist) }
  it { should validate_presence_of(:name) }

  describe ".paginate" do
    let!(:items) { create_list(:item, 50) }
    it "returns items per page" do
      limit = 20
      page = 1
      expect(Item.paginate(limit, page)).to eq(
        Item.limit(20).offset(1)
      )
    end
  end
end
