class UserMailer < ActionMailer::Base
  default from: "mehtamehta1789@gmail.com"
  
  def registration_confirmation(addrss)
    @name = addrss
    # @task = task.name
    mail(:to => addrss , :subject => 'registration' )
  end

 

  


end
