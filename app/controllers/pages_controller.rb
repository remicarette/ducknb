class PagesController < ApplicationController
  def home
    ducks_of_the_moment(filter_by_average(filter_by_reviews))
  end

  private

  # Place dans une variable d'instance 3 ducks aleatoire provenant d'une liste des meilleurs ducks
  def ducks_of_the_moment(ducks)
    @ducks_of_the_moment = []
    3.times do
      duck = ducks.sample
      @ducks_of_the_moment.push(duck)
      ducks.delete(duck)
    end
    @ducks_of_the_moment.compact!
  end

  # Calcul la moyenne de tout les ducks
  def ducks_average(ducks)
    list_average = []
    ducks.each do |duck|
      average = 0
      duck.reviews.each do |review|
        average += review.stars
      end
      average /= duck.reviews.length if duck.reviews.size != 0
      list_average.push(average) if duck.reviews.size != 0
    end
    return list_average.sum / list_average.size
  end

  # Filtre les ducks ayant plus de 10 reviews
  def filter_by_reviews
    ducks = Duck.all
    filter_ducks = ducks.select do |duck|
      duck.reviews.size >= 5
    end
    return filter_ducks
  end

  # Filtre les ducks ayant une moyenne superieur a la moyenne de tout les ducks
  def filter_by_average(ducks)
    average_references = ducks_average(ducks)
    ducks.each do |duck|
      average = 0
      duck.reviews.each do |review|
        average += review.stars
      end
      average /= duck.reviews.length
      ducks.delete(duck) if average < average_references
    end
    return ducks
  end
end
