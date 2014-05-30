require 'rexml/document'

class AlfredResponder
  def self.run(responses)
    doc = REXML::Document.new
    items = doc.add_element('items')

    responses.each do |response|
      item = items.add_element('item')
      item.add_attribute('arg', response.arg)
      item.add_element('title').add_text(response.title)
      item.add_element('subtitle').add_text(response.subtitle)
    end

    puts doc.to_s
  end
end
