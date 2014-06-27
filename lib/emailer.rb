require 'mailgun'

class Emailer
  Mailgun.configure do |config|
    config.api_key = 'key-6uiavyyd3nmb9adpaii04drw93y8ymq8'
    config.domain  = 'sandbox9e40982438de4c218c126056aa8f25ea.mailgun.org'
  end

  def send_email
    @scraper = Scraper.new("https://www.youtube.com/user/GoProCamera/feed?filter=2")
    parameters = {
      :to => "wsisson1@gmail.com",
      :subject => "New Video",
      :text => "Here it is: #{@scraper.upload}",
      :from => "postmaster@sandbox9e40982438de4c218c126056aa8f25ea.mailgun.org"
    }
    @mailgun = Mailgun()
    @mailgun.messages.send_email(parameters)
  end
end