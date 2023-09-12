require_relative '../lib/classes/author'
require_relative '../lib/item'

RSpec.describe Author do
  describe '#add_item' do
    it 'adds the item to the author' do
      author = Author.new('Ahmed', 'Eid')
      item = Item.new('01/01/2019', false)

      author.add_item(item)

      expect(author.items).to include(item)
      expect(item.author).to eq(author)
    end

    it 'does not add the same item twice' do
      author = Author.new('Ahmed', 'Eid')
      item = Item.new('01/01/2019', false)

      author.add_item(item)
      author.add_item(item)

      expect(author.items.size).to eq(1)
    end
  end
end
