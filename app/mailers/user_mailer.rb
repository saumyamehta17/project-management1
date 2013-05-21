class UserMailer < ActionMailer::Base
  default from: "smehta1289@gmail.com"
  @name = ""
  def registration_confirmation(addrss)
    @name = addrss
    mail(:to => addrss , :subject => 'registraion' )

  end

  def name
    @name = @name.split('@')
  end


end
