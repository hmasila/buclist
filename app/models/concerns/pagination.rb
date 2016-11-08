module Pagination
  MAX_LIMIT = 100
  DEFAULT_LIMIT = 20

  def paginate(limit, page)
    limit(get_limit(limit.to_i)).offset(get_offset(limit.to_i, page.to_i))
  end

  private

  def get_limit(limit)
    limit = if limit <= 0
              DEFAULT_LIMIT
            elsif limit > MAX_LIMIT
              MAX_LIMIT
            else
              limit
            end
    limit
  end

  def get_offset(limit, page)
    offset = if page >= 1
               ((page - 1) * limit + 1)
             else
               0
             end
    offset
  end
end
