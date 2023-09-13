require_relative '../lib/models/book'

describe Book do
  before(:each) do
    @book = Book.new('The Pragmatic Programmer', 'Addison-Wesley', 'bad', '1999-10-10', true)
  end

  describe '#new' do
    it 'Should return a new Book object' do
      expect(@book).to be_an_instance_of(Book)
    end

    it 'Should be an extended Item object' do
      expect(@book).to be_a_kind_of(Item)
    end

    it 'Should have a title' do
      expect(@book.title).to eql('The Pragmatic Programmer')
    end

    it 'Should not have a setter for publisher' do
      expect { @book.publisher = 'O\'Reilly' }.to raise_error(NameError)
    end
  end

  describe '#can_be_archived?' do
    it 'Should return true if the publish date is older than 10 years' do
      expect(@book.can_be_archived?).to eql(true)
    end

    it 'Should return true if cover state is bad' do
      expect(@book.can_be_archived?).to eql(true)
    end

    it 'Should return false if publish_date < 10 && cover_state != bad' do
      book = Book.new('Book', 'Publisher', 'good', '2019-10-10', true)
      expect(book.can_be_archived?).to eql(false)
    end
  end
end
