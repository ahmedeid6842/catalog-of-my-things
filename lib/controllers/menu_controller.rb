class Menu
  MENU_OPTIONS = [
    { number: 1, description: 'List all books', action: :list_all_books },
    { number: 2, description: 'List all music albums', action: :list_all_albums },
    { number: 3, description: 'List of games', action: :list_of_games },
    { number: 4, description: 'List all genres', action: :list_all_genres },
    { number: 5, description: 'List all labels', action: :list_all_labels },
    { number: 6, description: 'List all authors', action: :list_all_authors },
    { number: 7, description: 'Add a book', action: :add_book },
    { number: 8, description: 'Add a music album', action: :add_album },
    { number: 9, description: 'Add a game', action: :add_game },
    { number: 10, description: 'Exit', action: :exit_app }
  ].freeze

  def initialize(app)
    @app = app
  end

  def display_menu
    loop do
      show_options

      option = gets.chomp.to_i

      menu_option = MENU_OPTIONS.find { |item| item[:number] == option }
      if menu_option
        send(menu_option[:action])
        break if menu_option[:action] == :exit_app # Break out of the loop when "Exit" option is selected
      else
        puts 'Please select a valid option'
      end
    end
  end

  private

  def show_options
    puts "\nSelect an option by entering a number:"
    MENU_OPTIONS.each { |item| puts "#{item[:number]} - #{item[:description]}" }
  end

  def list_all_books
    @app.list_all_books
  end

  def list_all_albums
    @app.list_all_albums
  end

  def list_of_games
    @app.list_of_games
  end

  def list_all_genres
    @app.list_all_genres
  end

  def list_all_labels
    @app.list_all_labels
  end

  def list_all_authors
    @app.list_all_authors
  end

  def add_book
    print 'Title: '
    title = gets.chomp
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover state [Good/Bad]: '
    cover_state = gets.chomp.downcase
    print 'Publish date [YYY-MM-DD]: '
    publish_date = gets.chomp
    print 'Archived? [Y/N]: '
    archived = gets.chomp.match?(/^[yY]$/)
    print 'Enter book label: '
    label_title = gets.chomp
    print 'Enter label color: '
    label_color = gets.chomp
    @app.add_a_book(title: title, publisher: publisher,
                    cover_state: cover_state, publish_date: publish_date, archived: archived,
                    label_title: label_title, label_color: label_color)
  end

  def add_album
    puts 'Enter the genre name: '
    genre_name = gets.chomp

    puts 'Enter the publish data: '
    publish_date = gets.chomp

    puts 'On Spotify? (true/false)'
    on_spotify = gets.chomp.downcase == 'true'

    @app.add_an_album(genre_name, publish_date, on_spotify)
  end

  def add_game
    puts 'Enter the author first name: '
    author_first_name = gets.chomp
    puts 'Enter the author last name: '
    author_last_name = gets.chomp

    print 'Is this game for multiple players? [Y/N]: '
    multiplayer = gets.chomp.downcase
    multiplayer = multiplayer == 'y'

    print 'Please enter the date this game was last played in: '
    last_played_at = gets.chomp

    print 'Please enter the date this game was published: '
    publish_date = gets.chomp

    @app.add_a_game(author_first_name, author_last_name, multiplayer, last_played_at, publish_date)
  end

  def exit_app
    puts 'Exiting the app...'
    @app.exit
  end
end
