require 'date'

class Item
  attr_accessor :publish_date, :genre, :label, :author
  attr_reader :id, :archived

  def initialize(publish_date, archived)
    @id = Random.rand(1..10_000)
    @publish_date = publish_date
    @archived = archived
    @author = nil
    @genre = nil
  end

  def add_author(author)
    author.add_item(self)
  end

  def add_genre(genre)
    genre.add_item(self)
  end

  def can_be_archived?
    Date.today.year - Date.parse(@publish_date).year > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def add_label=(label)
    @label = label
    label.add_item(self)
  end
end
