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

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/BlockLength
  def serialize_data(items)
    items.map do |item|
      if item.instance_of?(MusicAlbum)
        {
          type: 'MusicAlbum',
          id: item.id,
          genre_name: item.genre.name,
          publish_date: item.publish_date,
          on_spotify: item.on_spotify
        }
      elsif item.instance_of?(Game)
        {
          type: 'Game',
          id: item.id,
          multiplayer: item.multiplayer,
          last_played_at: item.last_played_at,
          publish_date: item.publish_date,
          author: "#{item.author.first_name} #{item.author.last_name}"
        }
      elsif item.instance_of?(Book)
        {
          type: 'Book',
          id: item.id,
          title: item.title,
          publisher: item.publisher,
          cover_state: item.cover_state,
          publish_date: item.publish_date,
          label: {
            title: item.label.title,
            color: item.label.color
          }
        }
      else
        next
      end
    end
  end

  def deserialize_data(items_data)
    items = []
    items_data.each do |item_data|
      if item_data['type'] == 'MusicAlbum'
        genre_name = item_data['genre_name']
        publish_date = item_data['publish_date'].to_i
        on_spotify = item_data['on_spotify']

        genre = Genre.new(genre_name)
        music_album = MusicAlbum.new(publish_date, on_spotify, false)
        music_album.add_genre(genre)
        items << music_album
      end

      if item_data['type'] == 'Game'
        multiplayer = item_data['multiplayer']
        last_played_at = item_data['last_played_at']
        publish_date = item_data['publish_date']
        first_name = item_data['author'].split[0]
        last_name = item_data['author'].split[1]

        new_game = Game.new(multiplayer, last_played_at, publish_date)
        game_author = Author.new(first_name, last_name)

        new_game.add_author(game_author)
        items << new_game
      end

      next unless item_data['type'] == 'Book'
      title = item_data['title']
      publisher = item_data['publisher']
      cover_state = item_data['cover_state']
      publish_date = item_data['publish_date']
      archived = item_data['archived']
      label_title = item_data['label']['title']
      label_color = item_data['label']['color']

      new_book = Book.new(title, publisher, cover_state, publish_date, archived)
      book_label = Label.new(label_title, label_color)

      new_book.add_label(book_label)
      items << new_book
    end
    items
  end

  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/BlockLength
end
