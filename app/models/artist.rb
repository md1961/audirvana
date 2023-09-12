class Artist < ApplicationRecord
  self.primary_key = :artist_id

  has_many :albums_artists
  has_many :albums, through: :albums_artists
  has_many :tracks_artists
  has_many :tracks, through: :tracks_artists

  MAJOR_COLUMNS = %i[artist_id name mb_name]

  scope :select_major, -> { select(MAJOR_COLUMNS) }

  def has_album?
    !albums.empty?
  end

  def classical?
    genres == %w[Classical]
  end

  def japan?
    genres == %w[Japan]
  end

  def oversea?
    !classical? && !japan?
  end

  def genres
    albums.flat_map(&:genre).uniq.sort
  end
end
