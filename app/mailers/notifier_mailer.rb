class NotifierMailer < ApplicationMailer

    def notify(email)
        mail(to: email, subject: "Welcome!")
    end


end
