class DucksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_duck, only: [:show, :edit, :update]

  def index
    @ducks = []
    if params[:city].present?
      @users = User.where(city: params[:city].downcase.capitalize)
    else
      @users = User.all
    end
  end

  def show
    @booking = Booking.new
    @carousel_counter = 1
    @duck = Duck.find(params[:id])
  end

  def search
  end

  def edit
  end

  def new
    @duck = Duck.new
  end

  def create
    @duck = Duck.new(duck_params)
    @duck.user = current_user

    if @duck.save
      redirect_to @duck, notice: 'Your duck was created.'
    else
      render :new
    end
  end

  def update
    if @duck.update(duck_params)
      redirect_to @duck, notice: 'The update was done.'
    else
      render :edit
    end
  end

  def destroy
    @duck = Duck.find(params[:id])
    @duck.destroy
    redirect_to profile_path(current_user.id), notice: 'Deleted'
  end

  private

  def set_duck
    @duck = Duck.find(params[:id])
  end

  def duck_params
    params.require(:duck).permit(:name, :race, :sex, :colour, :weight, :birthdate, :tags, :photo, :price)
  end

end
