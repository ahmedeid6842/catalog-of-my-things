require "./lib/classes/musicalbum"
require "./lib/classes/genre"
require "./lib/helpers/data_manager"
require_relative "lib/models/book"
require_relative "lib/classes/label"
require_relative "lib/classes/author"
require_relative "lib/classes/game"
require "set"

class App
  def initialize
    @items = []
    @genres = []
    @authors = []
    @labels = []
    @data_manager = DataManager.new(@items)
    load_data
  end

  def save_data
    @data_manager.save_data(@items)
  end

  def load_data
    @items = @data_manager.load_data
  end

  def list_all_books
    puts "List of books:"
    @items.each_with_index do |item, index|
      if item.instance_of?(Book)
        print "#{index + 1}) id: #{item.id} | title: #{item.title} | publisher: #{item.publisher} "
        puts "| cover state: #{item.cover_state} | publish date: #{item.publish_date}"
      end
    end
  end

  def list_all_labels
    puts "List of labels:"
    @items.each_with_index do |item, index|
      puts "#{index + 1}) #{item.label.title}" if item.instance_of?(Book)
    end
  end

  # rubocop:disable Metrics/MethodLength
  def add_a_book(title, publisher, cover_state, publish_date, archived, label_title, label_color)
    new_book = Book.new(title, publisher, cover_state, publish_date, archived)
    book_label = Label.new(label_title, label_color)

    new_book.add_label(book_label)
    @labels << book_label

    @items << new_book
    puts "Book created!"
  end

  # rubocop:enable Metrics/MethodLength

  def list_all_albums
    puts "List of albums:"
    @items.each_with_index do |item, index|
      puts "#{index + 1}- #{item}" if item.instance_of?(MusicAlbum)
    end
  end

  def list_all_genres
    puts "List of genres:"
    @items.each_with_index do |item, index|
      puts "#{index + 1}- #{item.genre.name}" if item.instance_of?(MusicAlbum)
    end
  end

  def add_an_album(genre_name, publish_date, on_spotify)
    genre = Genre.new(genre_name)
    music_album = MusicAlbum.new(publish_date, on_spotify, false)

    music_album.add_genre(genre)
    @items << music_album
    puts "Album added!"
  end

  def add_a_game(author_first_name, author_last_name, multiplayer, last_played_at, publish_date)
    new_game = Game.new(multiplayer, last_played_at, publish_date)
    game_author = Author.new(author_first_name, author_last_name)

    new_game.add_author(game_author)
    @authors << game_author

    @items << new_game
    puts "Game added!"
  end

  def list_of_games
    puts "List of games:"
    @items.each_with_index do |item, index|
      next unless item.instance_of?(Game)

      print "#{index + 1}) id: #{item.id} - author: #{"#{item.author.first_name} #{item.author.first_name}"} "
      # rubocop:disable Layout/LineLength
      puts "- multiplayer: #{item.multiplayer} - last played at: #{item.last_played_at} - publish date: #{item.publish_date}"
      # rubocop:enable Layout/LineLength
    end
  end

  def list_all_authors
    puts "List of authors:"
    authors = Set.new

    @items.each do |item|
      authors.add("#{item.author.first_name} #{item.author.last_name}") if item.instance_of?(Game)
    end

    authors.each_with_index do |author, index|
      puts "#{index + 1}) #{author}"
    end
  end

  def exit
    save_data
    puts "Bye!"
  end
end
