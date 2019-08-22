class BookingsController < ApplicationController
  def index
    user = current_user
    @my_bookings = Booking.where(user: user).order(status: :desc)
    @my_ducks_bookings = current_user.ducks_bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
