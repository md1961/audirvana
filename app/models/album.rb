class Album < ApplicationRecord
  self.primary_key = :album_id

  MAJOR_COLUMNS = %i[album_id title label]

  scope :select_major, -> { select(MAJOR_COLUMNS) }
end
