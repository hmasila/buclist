require 'rails_helper'

RSpec.describe BucketList, type: :model do
  it { should belong_to :user }
  it { should have_many :items }
  it { should validate_presence_of :name }

  describe '.search_by_name' do
    let!(:bucket_list) { create(:bucket_list, name: 'December') }
    context 'when query exists' do
      it 'returns the bucketlist' do
        expect(BucketList.search_by_name('December')).to eql
        Bucketlist.where('name LIKE ?', 'December').first
      end
    end

    context 'when query does not exist' do
      it 'raises ActiveRecord::RecordNotFound error' do
        expect(BucketList.search_by_name('February'))
          .to raise_error(ActiveRecord::RecordNotFound, /February not found/)
      end
    end
  end

  describe '.paginate' do
    let!(:bucket_lists) { create_list(:bucket_list, 5) }
    it 'returns the first n bucket lists' do
      expect(Bucketlist.paginate(limit: 2, page: 1).first).to eq(
        Bucketlist.limit(2).offset(0).first
      )
    end
  end
end
