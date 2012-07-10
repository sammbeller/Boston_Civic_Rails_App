ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "0.0.0:3000",  
  :user_name            => "wheresmylane",  
  :password             => "bostoncivicJBS",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}  
ActionMailer::Base.default_url_options[:host] = "localhost:3000"  