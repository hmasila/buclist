require "rails_helper"

RSpec.describe "Items requests", type: :request do
  let!(:user) { create(:user) }
  let!(:bucket_list) { create(:bucket_list, user_id: user.id) }
  let!(:items) { create_list(:item, 10, bucket_list_id: bucket_list.id) }
  let(:bucket_id) { bucket_list.id }
  let(:item_id) { items.last.id }

  describe "GET /bucket_lists/:bucket_id/items" do
  end

  describe "GET /bucket_lists/:bucket_id/items/:item_id" do
  end

  describe "POST /bucket_lists/:bucket_id/items" do
  end

  describe "POST /bucket_lists/:bucket_id/items" do
  end

  describe "PUT /bucket_lists/:bucket_id/items/:item_id" do
  end

  describe "DELETE /bucket_lists/:bucket_id/items/:item_id" do
  end
end
