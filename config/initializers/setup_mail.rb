ActionMailer::Base.smtp_settings = {
  address:        'smtp.gmail.com', # default: localhost
  domain:         'gmail.com' ,   
  port:           '587',                  # default: 25
  user_name:      'mehtasweety89',
  password:       'lovelydreams',
  authentication: :plain ,                # :plain, :login or :cram_md5
  :enable_starttls_auto => true
}
