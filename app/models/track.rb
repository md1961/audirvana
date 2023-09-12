class Track < ApplicationRecord
  self.primary_key = :track_id

  belongs_to :album
  has_one :tracks_artist
  has_one :artist, through: :tracks_artist

  MAJOR_COLUMNS = %i[track_id title genre]

  scope :select_major, -> { select(MAJOR_COLUMNS) }
end
