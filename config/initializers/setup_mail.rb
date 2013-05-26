ActionMailer::Base.smtp_settings = {
  address:        'smtp.gmail.com', # default: localhost
  domain:         'gmail.com' ,   
  port:           '25',                  # default: 25
  user_name:      'mehtamehta1789',
  password:       'mehtamehta',
  authentication: :plain ,                # :plain, :login or :cram_md5
  :enable_starttls_auto => true
}
