require_relative '../item'

class Book < Item
  attr_accessor :title, :cover_state
  attr_reader :publisher

  def initialize(title, publisher, cover_state, *args)
    super(*args)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
