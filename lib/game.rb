class Game
	attr_reader :board

	def initialize
		@board = Array.new(6) {Array.new(7, nil)}
		@player_turn = true
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
			if @player_turn
				@player_turn = false
				@board[depth][number] = 'red'
			else
				@player_turn = true
				@board[depth][number] = 'yellow'
			end
	end

#Win condition checks	
	def horizontal_win?
		#ADD METHOD HERE!!!!!
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
game.place_pin(1)
game.place_pin(1)
game.pretty_print
