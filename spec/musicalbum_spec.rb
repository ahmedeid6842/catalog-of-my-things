require_relative '../lib/classes/musicalbum'
require_relative '../lib/classes/genre'

describe MusicAlbum do
  before(:each) do
    @music_album = MusicAlbum.new('01/01/2019', false, false)
  end

  describe '#new' do
    it 'Should return a new MusicAlbum object' do
      expect(@music_album).to be_an_instance_of(MusicAlbum)
    end

    it 'Should have a publish date' do
      expect(@music_album.publish_date).to eql('01/01/2019')
    end

    it 'Should have a boolean value for on_spotify' do
      expect(@music_album.on_spotify).to eql(false)
    end

    it 'Should not have a setter for id' do
      expect { @music_album.id = 1 }.to raise_error(NameError)
    end
  end

  describe '#add_genre' do
    it 'Should add a genre to the music album' do
      genre = Genre.new('Action')
      music_album = MusicAlbum.new('01/01/2019', false, false)
      music_album.add_genre(genre)
      expect(music_album.genre).to eql(genre)
    end
  end

  describe '#can_be_archived?' do
    it 'Should return true if the publish date is older than 10 years' do
      music_album = MusicAlbum.new('01/01/2009', true, true)
      expect(music_album.can_be_archived?).to eq(true)
    end

    it 'Should return true if on_spotify is ture' do
      music_album = MusicAlbum.new('01/01/2000', true, false)
      expect(music_album.can_be_archived?).to eq(true)
    end

    it 'Should return false if publish_date < 10 && on_spotify != false' do
      music_album = MusicAlbum.new('01/01/2019', true, false)
      expect(music_album.can_be_archived?).to eq(false)
    end
  end
end
