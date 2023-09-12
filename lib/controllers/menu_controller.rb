class MenuController
  def initialize(app)
    @app = app
  end

  def display_menu
    menu = {
      1 => 'List all books',
      2 => 'List all music albums',
      3 => 'List of games',
      4 => 'List all genres',
      5 => 'List all labels',
      6 => 'List all authors',
      7 => 'Add a book',
      8 => 'Add a music album',
      9 => 'Add a game',
      10 => 'Exit'
    }

    puts "\nSelect an option by entering a number:"

    menu.each do |key, value|
      puts "#{key} - #{value}"
    end

    validate_option
  end

  def validate_option
    option = gets.chomp.to_i

    menu_actions = {
      1 => :list_all_books,
      2 => :list_all_albums,
      3 => :list_of_games,
      4 => :list_all_genres,
      5 => :list_all_labels,
      6 => :list_all_authors,
      7 => :add_a_book,
      8 => :add_an_album,
      9 => :add_a_game,
      10 => :exit
    }

    action = menu_actions[option]

    if action
      @app.send(action)
    else
      puts 'Select a valid option'
      display_menu
    end
  end
end
