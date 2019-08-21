class DucksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_duck, only: [:show, :edit, :update]

  def index
    @ducks = []
    users = User.where(city: params[:search].downcase.capitalize)
    users.each do |user|
      user.ducks.each do |duck|
        @ducks << duck
      end
    end
    return @ducks_url
  end

  def show
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
    redirect_to ducks_url, notice: 'Deleted'
  end

  private

  def set_duck
    @duck = Duck.find(params[:id])
  end

  def duck_params
    params.require(:duck).permit(:name, :race, :sex, :colour, :weight, :birthdate, :tags)
  end
end
