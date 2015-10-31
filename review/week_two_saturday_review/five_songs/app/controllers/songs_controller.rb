class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(params.require(:song).permit([:title, :video_link]))
    if @song.save
      redirect_to root_path
    else
      render :new
    end
  end

end
