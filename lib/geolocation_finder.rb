class GeolocationFinder
  attr_accessor :ip

  def initialize(ip)
    self.ip = ip
  end

  def ipstack
    IpStack.new(ip).fetch_data
  end
end
