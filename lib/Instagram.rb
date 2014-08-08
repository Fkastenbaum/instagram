require 'instagram'

class InstagramScraper

	Instagram.configure do |config|
	  config.client_id = "f2d8fd3f0866489c80332a7d7c440a45"
	  config.client_secret ="f7cd4ebdd49b47d283efb67f0cf23fa3"
	# For secured endpoints only
	#config.client_ips = '<Comma separated list of IPs>'
	end

	def initialize(access_token)
		@access_token = access_token
	end

	def get_pics
		 client = Instagram.client(:access_token => @access_token)
		 user = client.user("419976626")
		 media_item = client.user_recent_media("419976626")
		  media_item
	end 


	#def a method that pulls an instagram photo by its own id

# 	def image1
# 		@image1_page = 782697165059878708_419976626


# end 

# def image2
# 	:name = 782697165059878708_419976626
# end 



end