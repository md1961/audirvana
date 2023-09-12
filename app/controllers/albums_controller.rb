class AlbumsController < ApplicationController

  def index
    @albums = Album.local
  end
end
