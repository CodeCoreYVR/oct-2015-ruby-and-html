class SongsController < ApplicationController
  before_action :find_song, only: [:update, :destroy]

  def index
    @songs = Song.recent_five
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
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
    if @song.update_attributes(song_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to root_path
  end

  private

    def song_params
      params.require(:song).permit([:title, :video_link])
    end

    def find_song
      @song = Song.find(params[:id])
    end

end
