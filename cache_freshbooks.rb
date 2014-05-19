require_relative 'lib/client_cache'
require_relative 'lib/client_list'

ClientCache.new.write(ClientList.retrieve)

puts 'Freshbooks clients cached successfully'
