class SongsController < ApplicationController

  def index
    @songs = Song.recent_five
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

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update_attributes(params.require(:song).permit([:title, :video_link]))
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to root_path
  end
end
