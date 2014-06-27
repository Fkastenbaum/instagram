require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require './lib/emailer.rb'
require './lib/scraper.rb'
require 'nokogiri'
require 'open-uri'

get '/' do
  scraper = Scraper.new("https://www.youtube.com/user/GoProCamera/feed?filter=2")
  scraper.uploads
  @link = scraper.link
  @headline = scraper.headline
  @time = scraper.time
  erb :index
end
