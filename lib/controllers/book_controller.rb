require_relative '../models/book'
require_relative 'label_controller'

class BookController < LabelController
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
    print 'Title: '
    title = gets.chomp

    print 'Publisher: '
    publisher = gets.chomp

    print 'Cover state [Good/Bad]: '
    cover_state = gets.chomp

    print 'Publish date [YYY-MM-DD]: '
    publish_date = gets.chomp

    print 'Archived? [Y/N]: '
    archived = gets.chomp.match?(/^[yY]$/)

    puts 'Please select a label: '
    list_all_labels
    label_index = gets.chomp.to_i
    relevant_label = @labels.find { |label| label.id == label_index }

    new_book = Book.new(title, publisher, cover_state, publish_date, archived)

    new_book.label = relevant_label
    @books << new_book
    puts 'Book created!'
  end
end
