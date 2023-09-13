class Genre
  attr_reader :name

  NAME_FOR_ALL = 'All'
  NAMES = [NAME_FOR_ALL] + %w[Classical Japan Oversea]

  def self.all
    NAMES.map { |name| self.new(name) }
  end

  def self.find_by_name(name)
    name_defaulted = NAMES.include?(name) ? name : NAME_FOR_ALL
    all.find { |genre| genre.name == name_defaulted }
  end

  def initialize(name)
    @name = name
  end

  def all?
    name == NAME_FOR_ALL
  end

  def filter_albums(albums)
    return albums if all?
    albums.find_all { |album| album.artist&.send(adjective) }
  end

  def to_s
    name
  end

  private

    def adjective
      :"#{name.downcase}?"
    end
end
