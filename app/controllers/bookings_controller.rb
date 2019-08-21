class BookingsController < ApplicationController
  def index
    user = current_user
    @bookings = Booking.where(user_id: user.id).order(status: :desc)
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
