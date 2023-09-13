require_relative '../lib/classes/genre'
require_relative '../lib/item'

describe Genre do
  before(:each) do
    @genre = Genre.new('Action')
  end

  describe '#new' do
    it 'Should return a new Genre object' do
      expect(@genre).to be_an_instance_of(Genre)
    end

    it 'Should have a name' do
      expect(@genre.name).to eql('Action')
    end

    it 'Should not have a setter for id' do
      expect { @genre.id = 1 }.to raise_error(NameError)
    end
  end

  describe '#add_item' do
    it 'Should add an item to the genre' do
      item = Item.new('01/01/2019', false)
      genre = Genre.new('Action')
      genre.add_item(item)
      expect(genre.items).to include(item)
    end
  end
end
