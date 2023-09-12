require_relative 'item'
class MusicAlbum < Item
  attr_accessor :on_spotify
  def initialize(genre, publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
    @genre = genre
  end

  def to_s
    "Album: #{@id} - #{@genre} - Publish Date: #{@publish_date} - On Spotify: #{@on_spotify}"
  end

  def can_be_archived?
    super().can_be_archived? && @on_spotify
  end
end