require 'nokogiri'
require 'open-URI'
require 'mailgun'
require './lib/scraper.rb'
require './lib/emailer.rb'

task :check_tweet_time do
  @scraper = Scraper.new("https://www.youtube.com/user/GoProCamera/feed?filter=2")
  normal_posted_time = Time.at(@scraper.tweet_time.to_i)
  if normal_posted_time > Time.now - 10 * 60
    @emailer = Emailer.new
    @emailer.send_email
    puts "Email sent!"
  else
 HEAD
    puts "No new videos"


  end
end