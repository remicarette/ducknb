class DucksController < ApplicationController
  def index
    @ducks = []
    users = User.where(city: 'Lille') # params[:query]
    users.each do |user|
      user.ducks.each do |duck|
        @ducks << duck
      end
    end
    return @ducks
  end

  def show
  end

  def search
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  def destroy
  end
end
