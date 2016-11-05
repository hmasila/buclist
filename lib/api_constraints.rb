class ApiConstraints
  attr_reader :version

  def initialize(options)
    @version = options[:version]
  end

  def matches?(req)
    req.headers["Accept"].include?("application/vnd.buclist.v#{@version}+json")
  end
end
