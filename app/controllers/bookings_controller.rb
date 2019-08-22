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

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.status = "pending"
    @booking.duck = Duck.find(params[:duck_id])

    if @booking.save!
      redirect_to bookings_path
    else
  end
end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :duck_id, :start, :end, :status)
  end
end
