ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "smtp.mandrillapp.com",
  :port => 587,
  :user_name => ENV["user_name"],
  :password => ENV["password"]
}
