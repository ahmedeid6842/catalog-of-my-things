require_relative '../item'

class Label
  attr_accessor :title, :color, :items
  attr_reader :id

  def initialize(id, title, color)
    @id = id || Random.rand(1..10_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    return if @items.include?(item)

    @items << item
    item.add_label = self
  end

  def to_s
    "#{@id} - Title: #{@title}, Color: #{@color}"
  end
end
