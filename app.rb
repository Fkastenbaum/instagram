require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require './lib/emailer.rb'
require './lib/scraper.rb'
require 'nokogiri'
require 'open-uri'

get '/' do
  scraper = Scraper.new("https://www.youtube.com/user/GoProCamera/feed?filter=2")
  @upload = scraper.uploads
  erb :index
end
