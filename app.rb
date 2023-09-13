require './lib/controllers/menu_controller'
require './lib/controllers/book_controller'
require './lib/controllers/label_controller'
require './lib/musicalbum'
require './lib/genre'
require './lib/helpers/data_manager'

class App
  def initialize
    @books = BookController.new
    @labels = LabelController.new
    @items = []
    @genres = []
    @data_manager = DataManager.new(@items)
    @menu = Menu.new(self)
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

  # Books management methods
  def list_all_books
    @books.list_all_books
    start
  end

  def add_a_book
    @books.add_a_book
    start
  end

  # Labels management methods
  def list_all_labels
    @labels.list_all_labels
    start
  end

  def add_a_label
    @labels.add_a_label
    start
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
    @genres << genre
    puts 'Enter the publish data: '
    publish_date = gets.chomp
    puts 'On Spotify? (true/false)'
    on_spotify = gets.chomp.downcase == 'true'
    @items << MusicAlbum.new(genre, publish_date, on_spotify)
    puts 'Album added!'
    @menu.display_menu
  end

  def exit
    save_data
    puts 'Bye!'
  end
end
