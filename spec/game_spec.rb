require_relative '../lib/classes/game'

RSpec.describe Game do
  describe '#can_be_archived?' do
    context 'when last played more than 2 years ago' do
      it 'returns true' do
        current_year = Date.today.year
        last_played_at = "#{current_year - 3}-01-01"
        game = Game.new(true, last_played_at, '2000-01-01')

        expect(game.can_be_archived?).to eq(true)
      end
    end

    context 'when last played within 2 years' do
      it 'returns false' do
        current_year = Date.today.year
        last_played_at = "#{current_year - 1}-01-01"
        game = Game.new(true, last_played_at, '2000-01-01')

        expect(game.can_be_archived?).to eq(false)
      end
    end
  end
end
