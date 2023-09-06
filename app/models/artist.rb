class Artist < ApplicationRecord
  self.primary_key = :artist_id

  has_many :albums_artists
  has_many :albums, through: :albums_artists

  MAJOR_COLUMNS = %i[artist_id name mb_name]

  scope :select_major, -> { select(MAJOR_COLUMNS) }
end
