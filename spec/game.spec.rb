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

	describe '#horizontal_win?' do
		it 'returns false when the condition is not met' do
			expect(game.horizontal_win?).to be(false)
		end
		
		it 'returns true when the condition is met' do
			expect(game.horizontal_win?.to be(true)
		end
	end	
	
	describe '#vertical_win?' do
		it 'returns false when the condition is not met' do
			expect(game.vertical_win?).to be(false)
		end
		
		it 'returns true when vertical win condition is met' do
			expect(game.vertical_win?).to be(true)
		end
	end
	
	describe '#ascending_win?' do
		it 'returns false when win condition is not met' do
			expect(game.ascending_win?).to be(false)
		end
		
		it 'returns true when win condition is met' do
			expect(game.ascending_win?).to be(true)
		end
	end

	describe '#descending_win?' do
		it 'returns false when win condition is not met' do
			expect(game.descending_win?).to be(false)
		end
		
		it 'returns true when win condition is met' do
			expect(game.descending_win?).to be(true)
		end
	end
end
