require_relative 'alfred_item'

class Client
  attr_reader :id, :name, :full_name, :email

  def initialize(options)
    @id = options.client_id
    @name = options.organization
    @full_name = [options.first_name, options.last_name].join(' ')
    @email = options.email
  end

  def to_alfred
    @alfred_item ||= AlfredItem.new(
      arg: "https://#{ENV['FRESHBOOKS_URL']}/showUser?userid=#{id}",
      title: name,
      subtitle: "#{full_name} - #{email}",
    )
  end
end
