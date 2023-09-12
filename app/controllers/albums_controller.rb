class AlbumsController < ApplicationController

  def index
    @albums = Album.local.sort
  end
end
