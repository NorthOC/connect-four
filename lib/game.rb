class Game
	attr_reader :board

	def initialize
		@board = Array.new(6) {Array.new(7, nil)}
		@player_turn = 'red'
	end

#Game logic	
	def place_pin(number)
			depth = 5
			number = number - 1
			placement = @board[depth][number]
			until placement == nil do
				depth = depth - 1
				placement = @board[depth][number]
			end
			if @player_turn == 'red'
				@player_turn = 'yellow'
				@board[depth][number] = 'red'
			else
				@player_turn = 'red'
				@board[depth][number] = 'yellow'
			end
	end

#Win condition checks	
	def horizontal_win?
		@board.each do |col|
		(0..3).each do |index|
			if @player_turn == 'red'
				won = col[index..(index + 3)].all? { |pin| pin == col[index] && !pin.nil? && pin == 'red' }
			else
				won = col[index..(index + 3)].all? { |pin| pin == col[index] && !pin.nil? && pin == 'yellow' }
			end
			return true if won
		end
		end
			return false
	end

	def vertical_win?
		temp = @board.transpose
		temp.each do |col|
		(0..2).each do |index|
			if @player_turn == 'red'
				won = col[index..(index + 3)].all? { |pin| pin == col[index] && !pin.nil? && pin == 'red' }
			else
				won = col[index..(index + 3)].all? { |pin| pin == col[index] && !pin.nil? && pin == 'yellow' }
			end
			return true if won
		end
		end
			return false
	end
#Pretty print to CLI
	def pretty_print
		@board.each do |arr|
			print arr
			print "\n"
		end
	end
end

game = Game.new
game.pretty_print
