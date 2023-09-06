class AlbumsArtist < ApplicationRecord
  belongs_to :album , foreign_key: :album_id
  belongs_to :artist, foreign_key: :artist_id
end
