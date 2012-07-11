ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "electric-galaxy-9820.herokuapp.com",  
  :user_name            => "wheresmylane",  
  :password             => "bostoncivicJBS",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}  
ActionMailer::Base.default_url_options[:host] = "electric-galaxy-9820.herokuapp.com"  