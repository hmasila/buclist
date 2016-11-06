module BucketListConcerns
  private

  def set_bucketlist(id)
    @bucketlist = BucketList.find_by!(id: id)
  end
end
