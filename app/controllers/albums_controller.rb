class AlbumsController < ApplicationController

  def index
    genre = Genre.find_by_name(params[:genre])
    @albums = genre.filter_albums(
      Album.includes(:artist, :tracks).local
    ).sort
  end
end
