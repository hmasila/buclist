module Pagination
  MAX_LIMIT = 100
  DEFAULT_LIMIT = 20

  def paginate(limit, page)
    limit(get_limit(limit)).offset(get_offset(limit, page))
  end

  private

  def get_limit(limit)
    if limit <= 0
      DEFAULT_LIMIT
    elsif limit > MAX_LIMIT
      MAX_LIMIT
    else
      limit
    end
  end

  def get_offset(limit, page)
    if page >= 1
      ((page - 1) * limit + 1)
    else
      0
    end
  end
end
