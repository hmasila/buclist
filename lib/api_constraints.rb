class ApiConstraints
  attr_reader :version

  def initialize(options)
    @version = options.fetch(:version)
  end

  def matches?(req)
    req.headers.fetch(:accept).include?("version=#{version}")
  end
end
