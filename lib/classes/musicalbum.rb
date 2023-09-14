require_relative '../item'
class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify, archived)
    super(publish_date, archived)
    @on_spotify = on_spotify
    @publish_date = publish_date
  end

  def to_s
    "Album: #{@id} - #{@genre} - Publish Date: #{@publish_date} - On Spotify: #{@on_spotify}"
  end

  def can_be_archived?
    super && @on_spotify
  end
end
