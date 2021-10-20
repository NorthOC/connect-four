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

		it 'places a "0" pin into the board' do
			expect(game.board[5][0]).to eq('0')
			
		end

			before do
				game.place_pin(1)
			end

		it ' places a "1" pin above the red one' do
			expect(game.board[4][0]).to eq('1')
		end
	end

	describe '#horizontal_win?' do
		it 'returns false when the condition is not met' do
			expect(game.horizontal_win?).to be(false)
		end

		context 'when the condition is met' do
		
			before do
				i = 1
				while i < 8
					game.place_pin(i)
					game.place_pin(i)
					i = i + 1
				end
			end

			it 'returns true' do
				expect(game.horizontal_win?).to be(true)
			end
		end
	end	
	
	describe '#vertical_win?' do
		it 'returns false when the condition is not met' do
			expect(game.vertical_win?).to be(false)
		end
		
		context "when the condition is met" do

			before do
				i = 1
				while i < 7
					game.place_pin(1)
					game.place_pin(3)
					i = i + 1
				end
			end

			it 'returns true when vertical win condition is met' do
				expect(game.vertical_win?).to be(true)
			end
		end
	end
	
	describe '#asceding_descending_win?' do
		it 'returns false when win condition is not met' do
			expect(game.ascending_descending_win?).to be(false)
		end
		
		context "when condition is met" do
			before do
				game.place_pin(1)
				2.times {game.place_pin(2)}
				game.place_pin(5)
				3.times {game.place_pin(3)}
				3.times {game.place_pin(4)}
				game.place_pin(4)	
			end
			
		
			it 'returns true' do
				expect(game.ascending_descending_win?).to be(true)
			end
		end

	end
end
