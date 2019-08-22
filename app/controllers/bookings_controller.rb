class BookingsController < ApplicationController
  def index
    user = current_user
    @my_bookings = Booking.where(user: user).order(status: :desc)
    @accepted = []
    @refused = []
    @pending = []
    @my_bookings.each do |booking|
      if booking.status == "pending"
        @pending << booking
      elsif booking.status == "accepted"
        @accepted << booking
      else
        @refused<< booking
    end
  end
    @my_ducks_bookings = current_user.ducks_bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = "accepted"
    @booking.save!
    redirect_to bookings_path
  end

  def refuse
    @booking = Booking.find(params[:id])
    @booking.status = "refused"
    @booking.save!
    redirect_to bookings_path
  end
end
