class Album < ApplicationRecord
  include Comparable

  self.primary_key = :album_id

  has_one :albums_artist
  has_one :artist, through: :albums_artist
  has_many :tracks, -> { order(:track_number) }

  MAJOR_COLUMNS = %i[album_id title label]

  scope :select_major, -> { select(MAJOR_COLUMNS) }

  scope :local, -> { where(source: 0) }

  scope :done, -> { where("label LIKE '%done%'") }

  def self.label_names
    local.pluck(:label).compact.flat_map(&:split).uniq
  end

  def labels
    (label&.split || []).map { |name|
      Albums::Label.find_by_name(name)
    }
  end

  def genre
    tracks.map(&:genre).uniq.join(', ')
  end

  def <=>(other)
    ordering <=> other.ordering
  end

  protected

    def ordering
      [artist || Artist::NIL, sort_title || '']
    end
end
