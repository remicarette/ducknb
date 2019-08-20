class ProfilesController < ApplicationController
  def show
    @ducks = Duck.where(id: params[:id])
  end
  
end
