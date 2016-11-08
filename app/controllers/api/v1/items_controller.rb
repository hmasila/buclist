class ItemsController < ApplicationController
  before_action :set_bucketlist_item, only: [:show, :update, :destroy]
  before_action :bucketlist_items, only: [:index, :create]

  def index
    json_response(paginate_items)
  end

  def create
    new_item = @bucketlist_items.new(list_params).save!
    json_response(new_item, :created)
  end

  def update
    @item.update!(list_params)
    head :no_content
  end

  def show
    json_response(@item)
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private

  def list_params
    params.permit(:name, :bucketlist_id, :done)
  end

  def paginate_items
    @bucketlist_items.paginate(params)
  end
end
