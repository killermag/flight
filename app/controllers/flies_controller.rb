class FliesController < ApplicationController
  def index 
    @flies = Fly.all
    @fly = Fly.new 

    if params[:fly].present? 
      a = params[:fly]
      a[:month] = "0#{a[:month]}" if a[:month].to_i < 10
      a[:day] = "0#{a[:day]}" if a[:day].to_i < 10 
      date = "%#{a[:year]}-#{a[:month]}-#{a[:day]}%"
      @flights = Fly.where "departure_date LIKE ?", date

    end 

  end 

  private 

  def fly_params 
    params.require(:fly).permit(:from, :to, :month, :year, :day)
  end 

end
