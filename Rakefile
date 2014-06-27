require 'nokogiri'
require 'mailgun'
require './lib/scraper.rb'
require './lib/emailer.rb'

task :check_tweet_time do
  @scraper = Scraper.new("https://www.twitter.com/jongrover")
  normal_tweeted_time = Time.at(@scraper.tweet_time.to_i)
  if normal_tweeted_time > Time.now - 10 * 60
    @emailer = Emailer.new
    @emailer.send_email
    puts "Email sent!"
  else
    puts "No new tweets ~ Do nothing!"
  end
end