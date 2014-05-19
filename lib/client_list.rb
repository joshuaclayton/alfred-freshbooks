require_relative 'client'
require_relative 'environment_loader'

class ClientList
  def self.retrieve
    EnvironmentLoader.run

    require 'freshbooks'

    FreshBooks::Base.establish_connection(ENV['FRESHBOOKS_URL'], ENV['FRESHBOOKS_TOKEN'])
    FreshBooks::Client.list.to_a
  end

  def initialize(clients)
    @clients = clients
  end

  def named(text)
    clients.select {|c| c.name =~ /#{text}/i }
  end

  private

  def clients
    @_clients ||= @clients.inject([]) do |result, obj|
      result << Client.new(obj)
    end
  end
end
