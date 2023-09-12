require_relative "../item"
require "date"

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date, archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    current_year = Date.today.year
    last_played_at_year = Date.parse(@last_played_at, "%Y-%m-%d").year
    super && current_year - last_played_at_year > 2
  end
end
