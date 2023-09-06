class Track < ApplicationRecord
  self.primary_key = :track_id

  belongs_to :album

  MAJOR_COLUMNS = %i[track_id title genre]

  scope :select_major, -> { select(MAJOR_COLUMNS) }
end
