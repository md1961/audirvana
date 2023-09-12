class TracksArtist < ApplicationRecord
  belongs_to :track , foreign_key: :track_id
  belongs_to :artist, foreign_key: :artist_id
end
