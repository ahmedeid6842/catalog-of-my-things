require_relative '../models/book'
require_relative '../helpers/list_manager'

class BookController < ListManager
  attr_accessor :books

  def initialize
    super
    @books = []
  end

  def list_all_books
    check_empty_list(@books, 'books')

    @books.each_with_index do |book, index|
      puts "#{index + 1} - #{book.title}"
    end
  end

  def add_a_book
    title, publisher, cover_state, publish_date, archived = book_data
    @books << Book.new(title, publisher, cover_state, publish_date, archived)
    puts 'Book created!'
  end

  def book_data
    print 'Title: '
    title = gets.chomp

    print 'Publisher: '
    publisher = gets.chomp

    print 'Cover state: '
    cover_state = gets.chomp

    print 'Publish date [YYY-MM-DD]: '
    publish_date = gets.chomp

    print 'Archive? [y/n]: '
    archived = gets.chomp.downcase == 'y'

    [title, publisher, cover_state, publish_date, archived]
  end
end
