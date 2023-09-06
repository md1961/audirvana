class Album < ApplicationRecord
  self.primary_key = :album_id

  has_one :albums_artist
  has_one :artist, through: :albums_artist
  has_many :tracks, -> { order(:track_number) }

  MAJOR_COLUMNS = %i[album_id title label]

  scope :select_major, -> { select(MAJOR_COLUMNS) }

  scope :local, -> { where("source = 0") }

  scope :done, -> { where("label LIKE '%done%'") }

  def genre
    tracks.map(&:genre).uniq.join(', ')
  end
end
