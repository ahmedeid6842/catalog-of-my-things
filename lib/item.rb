require 'date'

class Item
  attr_accessor :publish_date, :genre, :label
  attr_reader :id, :archived, :author

  def initialize(publish_date, archived)
    @id = Random.rand(1..10_000)
    @publish_date = publish_date
    @archived = archived
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
