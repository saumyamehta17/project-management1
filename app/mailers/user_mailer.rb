class UserMailer < ActionMailer::Base
  default from: "mehtasweety89@gmail.com"
  @name = ""
  def registration_confirmation(addrss)
    @name = addrss
    mail(:to => addrss , :subject => 'registration' )

  end

 

  def name
    @name = @name.split('@')
  end


end
