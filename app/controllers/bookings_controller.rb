class BookingsController < ApplicationController
    
    def new 
        @booking = Booking.new 
        @passengers = []
        params[:booking][:passenger_count].to_i.times do 
            @passengers << Passenger.new 
        end 
       
    end 


    def create 
        @fly = Fly.find(params[:booking][:flight_id])
        @passengers = []
        bool = false 
        
        params[:booking][:passenger_count].to_i.times do |n| 
            passenger = Passenger.create last_name: params[:booking][:passenger][:last_name][n],first_name: params[:booking][:passenger][:first_name][n], email: params[:booking][:passenger][:email]
            @booking = passenger.bookings.create fly: @fly

            @passengers << passenger 
            bool = true if @booking.save 
        end 

        if bool 
            PassengerMailer.with(passengers: @passengers, fly: @fly).welcome_email.deliver_now
            redirect_to flies_path
        else 
            flash.now[:alert] = "There was an error, please try again later"
            render :new
        end 


    end
end
