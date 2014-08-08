
require 'sinatra'
require 'rubygems'

class person

	get '/name/' do
		params[:name]
	end 

	get '/age/' do
		params[:age]
	end

end 