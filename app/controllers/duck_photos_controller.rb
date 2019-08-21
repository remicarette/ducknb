class DuckPhotosController < ApplicationController
  def new
  end

  def create
  end

  def article_params
    params.require(:article).permit(:url, :name, :duck)
  end
end
