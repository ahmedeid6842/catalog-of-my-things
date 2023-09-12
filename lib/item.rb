require 'date'

class Item
  attr_accessor :genre, :author, :label, :publish_date
  attr_reader :id, :archived

  def initialize(publish_date, archived, id: Random.rand(1..1000))
    @id = id
    @publish_date = publish_date
    @archived = archived
    @author = nil
    @genre = nil
    @label = nil
  end

  def add_author(author)
    author.add_item(self)
  end

  def add_genre(genre)
    genre.add_item(self)
  end

  def add_label(label)
    label.add_item(self)
  end

  def can_be_archived?
    date_10_years_ago = Date.today - (10 * 365)
    true unless @publish_date > date_10_years_ago
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end
