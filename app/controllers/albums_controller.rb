class AlbumsController < ApplicationController

  def index
    @genre = Genre        .find_by_name(params[:genre])
    @label = Albums::Label.find_by_name(params[:label])

    @albums = Album.includes(:artist, :tracks).local.then { |albums|
      @genre.filter_albums(albums)
    }.then { |albums|
      @label.filter_albums(albums)
    }.sort
  end
end
