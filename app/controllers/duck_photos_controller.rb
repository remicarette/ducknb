class DuckPhotosController < ApplicationController
  def new
    @duck_photos
  end

  def create
  end

  def article_params
    params.require(:article).permit(:url, :name, :duck)
  end
end
