class DucksController < ApplicationController

  before_action :set_duck, only: [:show, :edit, :update, :destroy]

  def index
    @ducks = Duck.all
  end

  def show
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
    @duck.destroy
    redirect_to ducks_path, notice: 'Deleted'
  end

  private

  def set_duck
    @duck = Duck.find(params[:id])
  end


  def duck_params
    params.require(:duck).permit(:name, :race, :sex, :colour, :weight, :birthdate, :tags)
  end
end
