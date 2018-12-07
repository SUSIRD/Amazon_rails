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

    def new_post_notifying(email, title, id, type_user)
        @email = email
        @title = title
        @id = id
        @type_user = type_user
        #@url ="http://localhost:3000/posts/#{@id}"
        @url = "https://amazon-vesp.herokuapp.com/posts/#{@id}"
        mail(to: @email, subject: "#{@title} - #{@type_user} New blog post on Amazon-Clone")
    end

    def edit_post_notifying(email, title, id, type_user)
        @email = email
        @title = title 
        @id = id 
        @type_user = type_user
        #@url ="http://localhost:3000/posts/#{@id}"
        @url = "https://amazon-vesp.herokuapp.com/posts/#{@id}"
        mail(to: @email, subject: "#{@title} - #{@type_user}  Blog post edited on Amazon-Clone" )
        end       
    end
    
   
    



#Variables de entorno
# Username 
# Password 
# User_token
# Pass_token : sha256

#Variables de entorno para trabajar en local y trabajar en producción