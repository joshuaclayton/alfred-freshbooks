require 'bundler'
Bundler.require :default

require_relative 'lib/client_cache'
require_relative 'lib/client_list'
require_relative 'lib/environment_loader'
require_relative 'lib/alfred_responder'

EnvironmentLoader.run

def load_results
  ClientList.new(ClientCache.new.read)
end

def respond(clients)
  AlfredResponder.run clients.map &:to_alfred
end

def freshbooks_homepage
  AlfredItem.new(
    arg: "https://#{ENV['FRESHBOOKS_URL']}",
    title: 'Freshbooks',
    subtitle: 'Open Freshbooks',
  )
end

if (ARGV[0] || '').strip == ''
  AlfredResponder.run [freshbooks_homepage]
else
  respond load_results.named(ARGV[0].strip)
end
