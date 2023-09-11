require 'date'

class Item
  attr_accessor :genre, :author, :label, :publish_date
  attr_reader :id, :archived

  def initialize(genre, author, label, publish_date, archived)
    @id = Random.rand(1..10_000)
    @publish_date = publish_date
    @archived = archived

    @genre = genre
    genre.add_item(self)

    @author = author
    author.add_item(self)

    @label = label
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
