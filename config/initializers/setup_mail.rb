ActionMailer::Base.smtp_settings = {
  address:        'smtp.gmail.com', # default: localhost
  domain:         'gmail.com' ,   
  port:           '587',                  # default: 25
  user_name:      'smehta1289',
  password:       'mehtasweety',
  authentication: :plain ,                # :plain, :login or :cram_md5
  :enable_starttls_auto => true
}
