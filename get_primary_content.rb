require 'rubygems'
require 'nokogiri'
require 'open-uri'

# url = 'http://mblongii.com'
# url = 'html/long_article.html'
url = 'html/all_articles.html'
# url = 'html/short_article.html'

ELEMENTS = []
elements = File.open('ELEMENTS').read
elements.each_line {|line|
  ELEMENTS.push line.strip
}

# Find out which element has the most content and if that element is in the 'elements' list
def find_element_with_most_content(url)
  doc = Nokogiri::HTML( open(url) )
  nodes = Hash.new(0)
  for tag in ELEMENTS
    doc.at_css(tag).traverse do |node|
      if node.element?
        nodes = {"name" => node.name, "length" => node.content.length, "content" => node.content}
      end
    end
    p nodes['length']
  end
end

def get_primary_content(url)
  find_element_with_most_content(url)
end

get_primary_content(url)
