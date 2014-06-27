require 'nokogiri'
require 'open-uri'
require 'mailgun'
require './lib/scraper.rb'
require './lib/emailer.rb'

task :check_youtube do
  @scraper = Scraper.new("https://www.youtube.com/user/GoProCamera/feed?filter=2")
  @scraper.uploads
  time_string = @scraper.time
  if time_string.match(/minute/).nil?
    puts "No new videos"
  else
    @emailer = Emailer.new
    @emailer.send_email(@scraper)
    puts "Email sent!"
  end
end