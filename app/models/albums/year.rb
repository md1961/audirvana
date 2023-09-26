class Albums::Year
  include Comparable

  def initialize(album)
    raise ArgumentError, "Argument must be an Album" unless album.is_a?(Album)

    @year_from_album, @years_from_tracks = album.then { |album|
      [
        album.release_year,
        album.tracks.map(&:year).uniq.compact.sort
      ]
    }
  end

  def strict?
    [@year_from_album] == @years_from_tracks
  end

  def contradicting?
    @year_from_album && !@years_from_tracks.empty? && !@years_from_tracks.include?(@year_from_album)
  end

  def value
    @year_from_album || @years_from_tracks.max
  end

  def values
    (@years_from_tracks + [@year_from_album]).uniq.compact.sort
  end

  def <=>(other)
    ordering <=> other.ordering
  end

  protected

    def ordering
      if strict?
        @year_from_album
      elsif !@years_from_tracks.empty?
        @years_from_tracks.sum.fdiv(@years_from_tracks.size)
      else
        9999
      end
    end
end
