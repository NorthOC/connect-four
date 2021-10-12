require '../lib/game.rb'

describe Game do
	subject(:game) {described_class.new}
	describe '#board' do
		it 'returns an 7x6 2d array' do
			expect(game.board.length).to eq(6)
			expect(game.board[0].length).to eq(7)
			expect(game.board[5].length).to eq(7)
		end
	end
	
	describe '#place_pin' do

			before do
				game.place_pin(1)
			end

		it 'places a red pin into the board' do
			expect(game.board[5][0]).to eq('red')
			
		end

			before do
				game.place_pin(1)
			end

		it ' places a yellow pin above the red one' do
			expect(game.board[4][0]).to eq('yellow')
		end
	end
	describe '#win?'	
end
