require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require 'open-uri'
require_relative 'lib/instagram.rb'

enable :sessions

CLIENT_ID="f2d8fd3f0866489c80332a7d7c440a45"
CLIENT_SECRET="f7cd4ebdd49b47d283efb67f0cf23fa3"
REDIRECT_URI="http://localhost:9393/callback"

Instagram.configure do |config|
  config.client_id = CLIENT_ID
  config.client_secret = CLIENT_SECRET
# For secured endpoints only
#config.client_ips = '<Comma separated list of IPs>'
end

get "/" do  
  erb :index
end

get "/connect" do
  redirect Instagram.authorize_url(:redirect_uri => REDIRECT_URI)
end

get "/callback" do
  response = Instagram.get_access_token(params[:code], :redirect_uri => REDIRECT_URI)
  session[:access_token] = response.access_token
  redirect "/results"
end

get "/results" do
	@token = session[:access_token]
	erb :result
end
 

get "/user_recent_media" do
  # client = Instagram.client(:access_token => session[:access_token])
  # user = client.user("419976626")
  @instagram_scraper = InstagramScraper.new(session[:access_token])
  @media_item = @instagram_scraper.get_pics
  # html = "<h1>#{user.username}'s recent media</h1>"
  # for media_item in client.user_recent_media("419976626")
  #   html << "<div style='float:left;'><a href='images1'><img src='#{media_item.images.thumbnail.url}'></a><br/> <a href='/media_like/#{media_item.id}'>Like</a>  <a href='/media_unlike/#{media_item.id}'>Un-Like</a>  <br/>LikesCount=#{media_item.likes[:count]}</div>"
  # end
  # html
  erb :user_recent_media
end

get '/user_recent_media/:id' do
  @instagram_scraper = InstagramScraper.new(session[:access_token])
  @image = @instagram_scraper
  @media_item = @instagram_scraper.get_pics
  # puts params[:id]
  @media_item.each do |item|
    puts item
    # if item.id == params[:id]
    #   @item = item
    # end
    # puts @item
  end
    
end


get "/location_recent_media" do
  client = Instagram.client(:access_token => session[:access_token])
  html = "<h1>Media from the Instagram Office</h1>"
  for media_item in client.location_recent_media(419976626)
    html << "<img src='#{@instagram_scraperl}'>"
  end
  html
end



