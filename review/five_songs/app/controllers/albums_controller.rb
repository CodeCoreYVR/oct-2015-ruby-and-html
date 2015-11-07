class AlbumsController < ApplicationController
  def index
    @album = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end
end
