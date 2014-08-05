require "dotenv"
Dotenv.load
require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require 'open-uri'

enable :sessions

Instagram.configure do |config|
  config.client_id = ENV["CLIENT_ID"]
  config.client_secret = ENV["CLIENT_SECRET"]
# For secured endpoints only
#config.client_ips = '<Comma separated list of IPs>'
end

get "/" do  
  erb :index
end

get "/connect" do
  redirect Instagram.authorize_url(:redirect_uri => ENV["REDIRECT_URI"])
end

get "/callback" do
  response = Instagram.get_access_token(params[:code], :redirect_uri => ENV["REDIRECT_URI"])
  session[:access_token] = response.access_token
  redirect "/results"
end

get "/results" do
	@token = session[:access_token]
	erb :result
end
  
  

