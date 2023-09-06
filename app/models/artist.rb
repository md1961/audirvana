class Artist < ApplicationRecord
  self.primary_key = :artist_id

  MAJOR_COLUMNS = %i[artist_id name mb_name]

  scope :select_major, -> { select(MAJOR_COLUMNS) }
end
