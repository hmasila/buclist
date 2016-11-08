class ApiConstraints
  attr_reader :version

  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    @default || check_headers(req)
  end

  def check_headers(req)
    req.headers["Accept"].include?("application/vnd.buclist.v#{@version}+json")
  end
end
