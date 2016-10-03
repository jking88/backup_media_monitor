class NotifierMailer < ApplicationMailer

    def notify(user)
        @user = user
        mail(to: @user.email, subject: "Welcome!")
    end


end
