class AlfredItem
  attr_reader :title, :subtitle, :arg

  def initialize(options)
    @title = options[:title]
    @subtitle = options[:subtitle]
    @arg = options[:arg]
  end
end
