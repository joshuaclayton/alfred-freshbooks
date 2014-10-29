require 'fileutils'

class ClientCache
  def initialize(path = 'tmp/clients.json')
    @path = path
  end

  def read
    Oj.load open(path, 'r') { |f| f.read }
  end

  def write(data)
    FileUtils.mkdir_p File.dirname(path)
    open(path, 'w') { |f| f.write(Oj.dump(data)) }
  end

  private

  attr_reader :path
end
