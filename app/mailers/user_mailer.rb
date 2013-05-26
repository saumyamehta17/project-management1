class UserMailer < ActionMailer::Base
  default from: "mehtamehta1789@gmail.com"
  
  def registration_confirmation(addrss,work)
    @name = addrss
    @workspace = work.name
    mail(:to => addrss , :subject => 'registration' )
  end

 

  


end
