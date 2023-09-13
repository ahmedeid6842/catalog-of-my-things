require './lib/controllers/menu_controller'
require './lib/classes/musicalbum'
require './lib/classes/genre'
require './lib/helpers/data_manager'
require './lib/classes/label'
require './lib/classes/author'

class App
  def initialize
    @menu = Menu.new(self)
    @items = []
    @genres = []
    @data_manager = DataManager.new(@items)
    load_data
  end

  def start
    @menu.display_menu
  end

  def save_data
    @data_manager.save_data(@items)
  end

  def load_data
    @items = @data_manager.load_data
  end

  def list_all_albums
    puts 'List of albums:'
    @items.each_with_index do |item, index|
      puts "#{index + 1}- #{item}" if item.instance_of?(MusicAlbum)
    end
    @menu.display_menu
  end

  def list_all_genres
    puts 'List of genres:'
    @items.each_with_index do |item, index|
      puts "#{index + 1}- #{item.genre.name}" if item.instance_of?(MusicAlbum)
    end
    @menu.display_menu
  end

  def add_an_album
    puts 'Enter the genre name: '
    genre_name = gets.chomp
    genre = Genre.new(genre_name)
    puts 'Enter the label title: '
    label_title = gets.chomp
    puts 'Enter the label color: '
    label_color = gets.chomp
    label = Label.new(label_title, label_color)
    puts 'Enter the author first name: '
    author_first_name = gets.chomp
    puts 'Enter the author last name: '
    author_last_name = gets.chomp
    author = Author.new(author_first_name, author_last_name)
    puts 'Enter the publish data: '
    publish_date = gets.chomp
    puts 'On Spotify? (true/false)'
    on_spotify = gets.chomp.downcase == 'true'
    music_album = MusicAlbum.new(publish_date, on_spotify, false)
    # music_album.add_label=label
    # music_album.add_author(author)
    music_album.add_genre(genre)
    @items << music_album
    puts 'Album added!'
    @menu.display_menu
  end

  def exit
    save_data
    puts 'Bye!'
  end
end
