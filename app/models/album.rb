class Album < ApplicationRecord
  self.primary_key = :album_id

  has_one :albums_artist
  has_one :artist, through: :albums_artist

  MAJOR_COLUMNS = %i[album_id title label]

  scope :select_major, -> { select(MAJOR_COLUMNS) }

  scope :local, -> { where("source = 0") }

  scope :done, -> { where("label LIKE '%done%'") }
end
