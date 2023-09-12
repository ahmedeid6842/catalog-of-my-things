require 'json'

class DataManager
  def initialize(items)
    @items = items
  end

  def save_data(items)
    items_data = serialize_data(items)
    File.write('./lib/records/items.json', JSON.generate(items_data))
  end

  def load_data
    items_data = File.exist?('./lib/records/items.json') ? JSON.parse(File.read('./lib/records/items.json')) : []
    deserialize_data(items_data)
  end

  def serialize_data(items)
    items_data = items.map do |item|
      if item.instance_of?(MusicAlbum)
        {
          type: 'MusicAlbum',
          id: item.id,
          genre_name: item.genre.name,
          publish_date: item.publish_date,
          on_spotify: item.on_spotify
        }
      end
    end
    items_data
  end

  def deserialize_data(items_data)
    items = []
    items_data.each do |item_data|
      if item_data['type'] == 'MusicAlbum'
        genre_name = item_data['genre_name']
        publish_date = item_data['publish_date'].to_i
        on_spotify = item_data['on_spotify']
  
        genre = Genre.new(genre_name)
        music_album = MusicAlbum.new(genre, publish_date, on_spotify)
        items << music_album
      end
    end
    items
  end
  
end