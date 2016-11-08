module Pagination
  attr_reader :limit, :offset

  MAX_LIMIT = 100
  DEFAULT_LIMIT = 20

  def paginate(params)
    @limit = params[:limit].to_i
    @page = params[:page].to_i
    limit(get_limit).offset(get_offset)
  end

  private

  def get_limit
    if @limit <= 0
      DEFAULT_LIMIT
    elsif @limit > MAX_LIMIT
      MAX_LIMIT
    else
      @limit
    end
  end

  def get_offset
    if @page >= 1
      ((@page - 1) * @limit + 1)
    else
      0
    end
  end
end
