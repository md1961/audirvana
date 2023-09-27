class Albums::Label
  include Comparable

  attr_reader :name

  NAME_FOR_ALL = 'All'

  def self.all
    @@all ||= ([NAME_FOR_ALL] + Album.label_names).map { |name| new(name) }
  end

  def self.find_by_name(name)
    name_defaulted = all.map(&:name).include?(name) ? name : NAME_FOR_ALL
    all.find { |label| label.name == name_defaulted }
  end

  def initialize(name)
    @name = name
  end

  def all?
    name == NAME_FOR_ALL
  end

  def filter_albums(albums)
    return albums if all?
    albums.find_all { |album| album.labels.include?(self) }
  end

  def <=>(other)
    ordering <=> other.ordering
  end

  def to_s
    name
  end

  protected

    ORDERINGS_BY_NAME = [NAME_FOR_ALL] + %w[done CD NB NSB NSG NG]

    def ordering
      ORDERINGS_BY_NAME.index(name) || 9999
    end
end
