require './lib/controllers/menu_controller'
require './lib/classes/musicalbum'
require './lib/classes/genre'
require './lib/helpers/data_manager'
require_relative 'lib/classes/author'
require_relative 'lib/classes/game'
require 'set'

class App
  def initialize
    @menu = Menu.new(self)
    @items = []
    @genres = []
    @authors = []
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
    puts 'Enter the publish data: '
    publish_date = gets.chomp
    puts 'On Spotify? (true/false)'
    on_spotify = gets.chomp.downcase == 'true'
    music_album = MusicAlbum.new(publish_date, on_spotify, false)
    music_album.add_genre(genre)
    @items << music_album
    puts 'Album added!'
    @menu.display_menu
  end

  def add_a_game
    puts 'Enter the author first name: '
    author_first_name = gets.chomp
    puts 'Enter the author first name: '
    author_last_name = gets.chomp

    print 'Is this game for multiple players? [Y/N]: '
    multiplayer = gets.chomp.downcase
    multiplayer = multiplayer == 'y'

    print 'Please enter the date this game was last played in: '
    last_played_at = gets.chomp

    print 'Please enter the date this game was published: '
    publish_date = gets.chomp

    new_game = Game.new(multiplayer, last_played_at, publish_date)
    game_author = Author.new(author_first_name, author_last_name)

    new_game.add_author(game_author)
    @authors << game_author

    @items << new_game
    puts 'Game added!'
    @menu.display_menu
  end

  def list_of_games
    puts 'List of games:'
    @items.each_with_index do |item, index|
      next unless item.instance_of?(Game)

      print "#{index + 1}) id: #{item.id} - author: #{"#{item.author.first_name} #{item.author.first_name}"} "
      # rubocop:disable Layout/LineLength
      puts "- multiplayer: #{item.multiplayer} - last played at: #{item.last_played_at} - publish date: #{item.publish_date}"
      # rubocop:enable Layout/LineLength
    end
    @menu.display_menu
  end

  def list_all_authors
    puts 'List of authors:'
    authors = Set.new

    @items.each do |item|
      authors.add("#{item.author.first_name} #{item.author.last_name}") if item.instance_of?(Game)
    end

    authors.each_with_index do |author, index|
      puts "#{index + 1}) #{author}"
    end
    @menu.display_menu
  end

  def exit
    save_data
    puts 'Bye!'
  end
end
