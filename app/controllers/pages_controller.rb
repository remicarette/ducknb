class PagesController < ApplicationController
  def home
    average
  end

  private

  def average
    @best_ducks = []
    ducks = Duck.all
    ducks.each do |duck|
      average = 0
      duck.reviews.each do |review|
        average += review.stars
      end
      average /= reviews.length
      @bets_ducks.push(duck) if average == 5
    end
  end
end
