class SongsController < ApplicationController

  def index
    @album = Album.find(params[:album_id])
    @songs = @album.songs
  end

  def new
    @album = Album.find(params[:album_id])
    @song = @album.songs.new
  end

  def create
    @album = Album.find(params[:album_id])
    @song = @album.songs.new(songs_params)

    if @song.save
      redirect_to album_songs_path(@album)
    else
      render :new
    end
  end

  private

  def songs_params
    params.require(:song).permit(:title, :artist, :duration, :price)
  end
end
