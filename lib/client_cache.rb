require 'oj'

class ClientCache
  def initialize(path = 'cache/clients.json')
    @path = path
  end

  def read
    Oj.load open(path, 'r') { |f| f.read }
  end

  def write(data)
    open(path, 'w') { |f| f.write(Oj.dump(data)) }
  end

  private

  attr_reader :path
end
