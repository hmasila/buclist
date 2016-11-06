class BucketListsController < ApplicationController
  before_action only: [:show, :update, :destroy] do
    set_bucketlist(params[:id])
  end

  def index
    @bucketlists = search_and_paginate || paginate_only
    json_response(@bucketlists)
  end

  def create
    @bucketlist = @current_user.bucketlists.new(list_params)
    @bucketlist.save!
    json_response(@bucketlist, :created)
  end

  def update
    @bucketlist.update!(list_params)
    head :no_content
  end

  def show
    json_response(@bucketlist)
  end

  def destroy
    @bucketlist.destroy
    head :no_content
  end

  private

  def list_params
    params.permit(:name, :created_by)
  end

  def search_and_paginate
    @current_user.bucket_lists.search(params[:q]).paginate(params) if params[:q]
  end

  def paginate_only
    @current_user.bucketlists.paginate(params)
  end
end
