require 'nokogiri'
require 'pry'
require 'open-uri'

class Scraper


  attr_accessor :doc

  def initialize doc
    @doc = Nokogiri::HTML(open(doc))
  end


  def uploads
    featured = doc.css(".yt-lockup-title")
    link = featured.at_css("h3 a").attributes["href"].value
    headline = "https://youtube.com#{link}"
  end

end

my_scraper = Scraper.new("https://www.youtube.com/user/GoProCamera/feed?filter=2")
puts my_scraper.uploads