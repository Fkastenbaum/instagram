require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require 'open-uri'
require_relative 'lib/instagram.rb'

enable :sessions

CLIENT_ID="f2d8fd3f0866489c80332a7d7c440a45"
CLIENT_SECRET="f7cd4ebdd49b47d283efb67f0cf23fa3"
REDIRECT_URI="http://localhost:9292/callback"

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

get '/user_recent_media/:name' do
  @instagram_scraper = InstagramScraper.new(session[:access_token])
  @image = @instagram_scraper
    
end


# post '/photo_info' do
#   puts params[:name]
#   puts params[:image]

# end

# get '/images1' do
#   client = Instagram.client(:access_token => session[:access_token])
#   user = client.user("419976626")
#   html = "<h1>More Info</h1>"
#   for media_item in client.user_recent_media("419976626")
#     html << "<div style='float:left;'><img src='#{media_item.images.thumbnail.url}'><br/> <a href='/media_like/#{media_item.id}'>Like</a>  <a href='/media_unlike/#{media_item.id}'>Un-Like</a>  <br/>LikesCount=#{media_item.likes[:count]}</div>"
#   end
#   html

#   erb :images1
# end

# get '/images2' do
#   client = Instagram.client(:access_token => session[:access_token])
#   user = client.user("419976626")
#   html = "<h1>More Info</h1>"
#   for media_item in client.user_recent_media("419976626")
#     html << "<div style='float:left;'><img src='#{media_item.images.thumbnail.url}'><br/> <a href='/media_like/#{media_item.id}'>Like</a>  <a href='/media_unlike/#{media_item.id}'>Un-Like</a>  <br/>LikesCount=#{media_item.likes[:count]}</div>"
#   end
#   html

#   erb :images2
# end



# get '/images3' do
#   client = Instagram.client(:access_token => session[:access_token])
#   user = client.user("419976626")
#   html = "<h1>More Info</h1>"
#   for media_item in client.user_recent_media("419976626")
#     html << "<div style='float:left;'><img src='#{media_item.images.thumbnail.url}'><br/> <a href='/media_like/#{media_item.id}'>Like</a>  <a href='/media_unlike/#{media_item.id}'>Un-Like</a>  <br/>LikesCount=#{media_item.likes[:count]}</div>"
#   end
#   html

#   erb :images3
# end



# get '/images4' do
#   client = Instagram.client(:access_token => session[:access_token])
#   user = client.user("419976626")
#   html = "<h1>More Info</h1>"
#   for media_item in client.user_recent_media("419976626")
#     html << "<div style='float:left;'><img src='#{media_item.images.thumbnail.url}'><br/> <a href='/media_like/#{media_item.id}'>Like</a>  <a href='/media_unlike/#{media_item.id}'>Un-Like</a>  <br/>LikesCount=#{media_item.likes[:count]}</div>"
#   end
#   html

#   erb :images4
# end


# get '/images5' do
#   client = Instagram.client(:access_token => session[:access_token])
#   user = client.user("419976626")
#   html = "<h1>More Info</h1>"
#   for media_item in client.user_recent_media("419976626")
#     html << "<div style='float:left;'><img src='#{media_item.images.thumbnail.url}'><br/> <a href='/media_like/#{media_item.id}'>Like</a>  <a href='/media_unlike/#{media_item.id}'>Un-Like</a>  <br/>LikesCount=#{media_item.likes[:count]}</div>"
#   end
#   html

#   erb :images5
# end


# get '/images6' do
#   client = Instagram.client(:access_token => session[:access_token])
#   user = client.user("419976626")
#   html = "<h1>More Info</h1>"
#   for media_item in client.user_recent_media("419976626")
#     html << "<div style='float:left;'><img src='#{media_item.images.thumbnail.url}'><br/> <a href='/media_like/#{media_item.id}'>Like</a>  <a href='/media_unlike/#{media_item.id}'>Un-Like</a>  <br/>LikesCount=#{media_item.likes[:count]}</div>"
#   end
#   html

#   erb :images6
# end


# get '/images7' do
#   client = Instagram.client(:access_token => session[:access_token])
#   user = client.user("419976626")
#   html = "<h1>More Info</h1>"
#   for media_item in client.user_recent_media("419976626")
#     html << "<div style='float:left;'><img src='#{media_item.images.thumbnail.url}'><br/> <a href='/media_like/#{media_item.id}'>Like</a>  <a href='/media_unlike/#{media_item.id}'>Un-Like</a>  <br/>LikesCount=#{media_item.likes[:count]}</div>"
#   end
#   html

#   erb :images7
# end


# get '/images8' do
#   client = Instagram.client(:access_token => session[:access_token])
#   user = client.user("419976626")
#   html = "<h1>More Info</h1>"
#   for media_item in client.user_recent_media("419976626")
#     html << "<div style='float:left;'><img src='#{media_item.images.thumbnail.url}'><br/> <a href='/media_like/#{media_item.id}'>Like</a>  <a href='/media_unlike/#{media_item.id}'>Un-Like</a>  <br/>LikesCount=#{media_item.likes[:count]}</div>"
#   end
#   html

#   erb :images8
# end

# get '/images9' do
#   client = Instagram.client(:access_token => session[:access_token])
#   user = client.user("419976626")
#   html = "<h1>More Info</h1>"
#   for media_item in client.user_recent_media("419976626")
#     html << "<div style='float:left;'><img src='#{media_item.images.thumbnail.url}'><br/> <a href='/media_like/#{media_item.id}'>Like</a>  <a href='/media_unlike/#{media_item.id}'>Un-Like</a>  <br/>LikesCount=#{media_item.likes[:count]}</div>"
#   end
#   html

#   erb :images9
# end

# get '/images10' do
#   client = Instagram.client(:access_token => session[:access_token])
#   user = client.user("419976626")
#   html = "<h1>More Info</h1>"
#   for media_item in client.user_recent_media("419976626")
#     html << "<div style='float:left;'><img src='#{media_item.images.thumbnail.url}'><br/> <a href='/media_like/#{media_item.id}'>Like</a>  <a href='/media_unlike/#{media_item.id}'>Un-Like</a>  <br/>LikesCount=#{media_item.likes[:count]}</div>"
#   end
#   html

#   erb :images10
# end


# get '/images11' do
#   client = Instagram.client(:access_token => session[:access_token])
#   user = client.user("419976626")
#   html = "<h1>More Info</h1>"
#   for media_item in client.user_recent_media("419976626")
#     html << "<div style='float:left;'><img src='#{media_item.images.thumbnail.url}'><br/> <a href='/media_like/#{media_item.id}'>Like</a>  <a href='/media_unlike/#{media_item.id}'>Un-Like</a>  <br/>LikesCount=#{media_item.likes[:count]}</div>"
#   end
#   html

#   erb :images11
# end


# get '/images12' do
#   client = Instagram.client(:access_token => session[:access_token])
#   user = client.user("419976626")
#   html = "<h1>More Info</h1>"
#   for media_item in client.user_recent_media("419976626")
#     html << "<div style='float:left;'><img src='#{media_item.images.thumbnail.url}'><br/> <a href='/media_like/#{media_item.id}'>Like</a>  <a href='/media_unlike/#{media_item.id}'>Un-Like</a>  <br/>LikesCount=#{media_item.likes[:count]}</div>"
#   end
#   html

#   erb :images12
# end


# get '/images13' do
#   client = Instagram.client(:access_token => session[:access_token])
#   user = client.user("419976626")
#   html = "<h1>More Info</h1>"
#   for media_item in client.user_recent_media("419976626")
#     html << "<div style='float:left;'><img src='#{media_item.images.thumbnail.url}'><br/> <a href='/media_like/#{media_item.id}'>Like</a>  <a href='/media_unlike/#{media_item.id}'>Un-Like</a>  <br/>LikesCount=#{media_item.likes[:count]}</div>"
#   end
#   html

#   erb :images13
# end

# get '/images14' do
#   client = Instagram.client(:access_token => session[:access_token])
#   user = client.user("419976626")
#   html = "<h1>More Info</h1>"
#   for media_item in client.user_recent_media("419976626")
#     html << "<div style='float:left;'><img src='#{media_item.images.thumbnail.url}'><br/> <a href='/media_like/#{media_item.id}'>Like</a>  <a href='/media_unlike/#{media_item.id}'>Un-Like</a>  <br/>LikesCount=#{media_item.likes[:count]}</div>"
#   end
#   html

#   erb :images14
# end


# get '/images15' do
#   client = Instagram.client(:access_token => session[:access_token])
#   user = client.user("419976626")
#   html = "<h1>More Info</h1>"
#   for media_item in client.user_recent_media("419976626")
#     html << "<div style='float:left;'><img src='#{media_item.images.thumbnail.url}'><br/> <a href='/media_like/#{media_item.id}'>Like</a>  <a href='/media_unlike/#{media_item.id}'>Un-Like</a>  <br/>LikesCount=#{media_item.likes[:count]}</div>"
#   end
#   html

#   erb :images15
# end


# get '/images16' do
#   client = Instagram.client(:access_token => session[:access_token])
#   user = client.user("419976626")
#   html = "<h1>More Info</h1>"
#   for media_item in client.user_recent_media("419976626")
#     html << "<div style='float:left;'><img src='#{media_item.images.thumbnail.url}'><br/> <a href='/media_like/#{media_item.id}'>Like</a>  <a href='/media_unlike/#{media_item.id}'>Un-Like</a>  <br/>LikesCount=#{media_item.likes[:count]}</div>"
#   end
#   html

#   erb :images16
# end

# get '/images17' do
#   client = Instagram.client(:access_token => session[:access_token])
#   user = client.user("419976626")
#   html = "<h1>More Info</h1>"
#   for media_item in client.user_recent_media("419976626")
#     html << "<div style='float:left;'><img src='#{media_item.images.thumbnail.url}'><br/> <a href='/media_like/#{media_item.id}'>Like</a>  <a href='/media_unlike/#{media_item.id}'>Un-Like</a>  <br/>LikesCount=#{media_item.likes[:count]}</div>"
#   end
#   html

#   erb :images17
# end

# get '/images18' do
#   client = Instagram.client(:access_token => session[:access_token])
#   user = client.user("419976626")
#   html = "<h1>More Info</h1>"
#   for media_item in client.user_recent_media("419976626")
#     html << "<div style='float:left;'><img src='#{media_item.images.thumbnail.url}'><br/> <a href='/media_like/#{media_item.id}'>Like</a>  <a href='/media_unlike/#{media_item.id}'>Un-Like</a>  <br/>LikesCount=#{media_item.likes[:count]}</div>"
#   end
#   html

#   erb :images18
# end

# get '/images19' do
#   client = Instagram.client(:access_token => session[:access_token])
#   user = client.user("419976626")
#   html = "<h1>More Info</h1>"
#   for media_item in client.user_recent_media("419976626")
#     html << "<div style='float:left;'><img src='#{media_item.images.thumbnail.url}'><br/> <a href='/media_like/#{media_item.id}'>Like</a>  <a href='/media_unlike/#{media_item.id}'>Un-Like</a>  <br/>LikesCount=#{media_item.likes[:count]}</div>"
#   end
#   html

#   erb :images19
# end

# get '/images20' do
#   client = Instagram.client(:access_token => session[:access_token])
#   user = client.user("419976626")
#   html = "<h1>More Info</h1>"
#   for media_item in client.user_recent_media("419976626")
#     html << "<div style='float:left;'><img src='#{media_item.images.thumbnail.url}'><br/> <a href='/media_like/#{media_item.id}'>Like</a>  <a href='/media_unlike/#{media_item.id}'>Un-Like</a>  <br/>LikesCount=#{media_item.likes[:count]}</div>"
#   end
#   html

#   erb :images20
# end
