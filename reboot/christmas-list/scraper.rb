
# require two modules
# assign url to variable
# get HTML file from urlbuild nokogiri document from HTML file
# look for information within the new doc

require 'open-uri'
require 'nokogiri'



def scraping(input_category)
  etsy_results = []
  html_file = open("https://www.etsy.com/search?q=#{input_category}")
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.card-meta-row').each do |title|
    etsy_results << title.text.strip
  end
  return etsy_results
end







