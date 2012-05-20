require 'rubygems'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML( open('http://mblongii.com') )
doc.at_css('body').traverse do |node|
  if node.element?
    p node.content
  end
end