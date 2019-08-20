class DucksController < ApplicationController
  before_action :set_duck, only: [:show, :edit]
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
