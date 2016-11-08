module BucketlistConcerns
  private

  def set_bucketlist
    @bucketlist = @current_user.bucketlists.find_by(id: params[:id])
  end

  def user_bucketlists
    @bucketlists = @current_user.bucketlists
  end

  def set_bucketlist_item
    bucketlist = @current_user.bucketlists.find_by(id: params[:bucketlist_id])
    @item = bucketlist.items.find_by(id: params[:id])
  end

  def bucketlist_items
    @items = @current_user.bucketlists.find_by(id: params[:bucketlist_id]).items
  end
end
