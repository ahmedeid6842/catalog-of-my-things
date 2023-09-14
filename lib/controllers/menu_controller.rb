class Menu
  def initialize(app)
    @app = app
  end

  def display_menu
    loop do
      puts "\nSelect an option by entering a number:"
      puts "1 - List all books"
      puts "2 - List all music albums"
      puts "3 - List of games"
      puts "4 - List all genres"
      puts "5 - List all labels"
      puts "6 - List all authors"
      puts "7 - Add a book"
      puts "8 - Add a music album"
      puts "9 - Add a game"
      puts "10 - Exit"

      option = gets.chomp.to_i

      case option
      when 1
        @app.list_all_books
      when 2
        @app.list_all_albums
      when 3
        @app.list_of_games
      when 4
        @app.list_all_genres
      when 5
        @app.list_all_labels
      when 6
        @app.list_all_authors
      when 7
        print "Title: "
        title = gets.chomp

        print "Publisher: "
        publisher = gets.chomp

        print "Cover state [Good/Bad]: "
        cover_state = gets.chomp.downcase

        print "Publish date [YYY-MM-DD]: "
        publish_date = gets.chomp

        print "Archived? [Y/N]: "
        archived = gets.chomp.match?(/^[yY]$/)

        print "Enter book label: "
        label_title = gets.chomp

        print "Enter label color: "
        label_color = gets.chomp

        @app.add_a_book(title, publisher, cover_state, publish_date, archived, label_title, label_color)
      when 8
        puts "Enter the genre name: "
        genre_name = gets.chomp

        puts "Enter the publish data: "
        publish_date = gets.chomp

        puts "On Spotify? (true/false)"
        on_spotify = gets.chomp.downcase == "true"

        @app.add_an_album(genre_name, publish_date, on_spotify)
      when 9
        puts "Enter the author first name: "
        author_first_name = gets.chomp
        puts "Enter the author first name: "
        author_last_name = gets.chomp

        print "Is this game for multiple players? [Y/N]: "
        multiplayer = gets.chomp.downcase
        multiplayer = multiplayer == "y"

        print "Please enter the date this game was last played in: "
        last_played_at = gets.chomp

        print "Please enter the date this game was published: "
        publish_date = gets.chomp

        @app.add_a_game(author_first_name, author_first_name, multiplayer, last_played_at, publish_date)
      when 10
        @app.exit
        puts "Exiting the app..."
        break
      else
        puts "Please, Select a valid option"
      end
    end
  end
end
