class AlbumsController < ApplicationController

  def index
    @genre = Genre.find_by_name(params[:genre])
    @albums = Album.includes(:artist, :tracks).local.then { |albums|
      @genre.filter_albums(albums)
    }.sort
  end
end
