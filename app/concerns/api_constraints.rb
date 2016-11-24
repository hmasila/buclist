class ApiConstraints
  attr_reader :version

  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(request)
    @default || check_headers(request)
  end

  def check_headers(request)
    request.
      headers["Accept"].
      include?("application/vnd.buclist.v#{@version}+json")
  end
end
