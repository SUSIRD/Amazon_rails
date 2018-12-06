class UserNotifierMailer < ApplicationMailer
    default from: 'hello@amazon-clone.com'

    #send a signup email to the user
    def send_subscribe_email(subscriptor)
        @subscriptor = subscriptor
        @subject = "Thanks for subscribe for our amazing app"
        mail(to: @subscriptor.email, subject: @subject )
    end

    # def cancel_account(user, admin, content)
        
    # end
end

#Variables de entorno
# Username 
# Password 
# User_token
# Pass_token : sha256

#Variables de entorno para trabajar en local y trabajar en producción