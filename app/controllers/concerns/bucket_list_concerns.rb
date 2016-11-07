module BucketListConcerns
  private

  def set_bucketlist
    @bucketlist = @current_user.bucketlists.find_by(id: params[:bucketlist_id])
  end

  def user_bucketlists
    @bucketlists = @current_user.bucketlists
  end

  def set_bucketlist_item
    @item = @bucketlist.items.find_by(id: :item_id)
  end

  def bucketlist_items
    @items = @bucketlist.items
  end
end
