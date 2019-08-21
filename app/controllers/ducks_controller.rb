class DucksController < ApplicationController
<<<<<<< HEAD

  before_action :set_duck, only: [:show, :edit, :update, :destroy]
=======
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_duck, only: [:show, :edit, :update]
>>>>>>> 4a399f5041e9d444dfac3657e31c07b1b25bf9a1

  def index
    @ducks = []
    if params[:search].present?
      @users = User.where(city: params[:search].downcase.capitalize)
    else
      @users = User.all
    end
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
    @duck.destroy
    redirect_to ducks_path, notice: 'Deleted'
  end

  private

  def set_duck
    @duck = Duck.find(params[:id])
  end

  def duck_params
    params.require(:duck).permit(:name, :race, :sex, :colour, :weight, :birthdate, :tags, :photo)
  end

end
