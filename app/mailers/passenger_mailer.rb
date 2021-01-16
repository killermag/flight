class PassengerMailer < ApplicationMailer
    default from: "odin@airways.com"


    def welcome_email 
        @passengers = params[:passengers]
        @fly = params[:fly]
        email = @passengers[0].email 
        mail(to: email, subject: "thank you for choosing to fly with us")
    end 

end
