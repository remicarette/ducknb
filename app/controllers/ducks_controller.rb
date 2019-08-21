class DucksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_duck, only: [:show, :edit]

  def index
    @ducks = Duck.all
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
    if @duck.update(article_params)
      redirect_to @article, notice: 'The update was done.'
    else
      render :edit
    end
  end

  def destroy
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
