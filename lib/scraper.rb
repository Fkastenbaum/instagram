require 'nokogiri'
require 'pry'
require 'open-uri'

class Scraper

  attr_accessor :doc
  attr_accessor :link
  attr_accessor :headline
  attr_accessor :time


  def initialize doc
    @doc = Nokogiri::HTML(open(doc))
  end


  def uploads
    featured = @doc.css(".yt-lockup-title")
    @link = featured.at_css("h3 a").attributes["href"].value
    @headline = "https://youtube.com#{link}"
    @time = @doc.css(".yt-lockup-meta-info").first.text.strip.gsub(/\d+\s+views/,'')
  end

end
