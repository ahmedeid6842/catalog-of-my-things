require 'date'

class Item
  attr_accessor :genre, :author, :label, :publish_date
  attr_reader :id, :archived

  def initialize(publish_date)
    @id = Random.rand(1..10_000)
    @publish_date = publish_date
    @genre = nil
    @archived = archived
  end

  def can_be_archived?
    date_10_years_ago = Date.today - (10 * 365)
    true unless @publish_date > date_10_years_ago
  end

  def add_genre(genre)
    genre.add_item(self)
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end
