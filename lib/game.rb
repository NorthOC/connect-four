class Game
	attr_reader :board

	def initialize
		@board = Array.new(6) {Array.new(7, nil)}
		@player_turn = '0'
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
			@board[depth][number] = @player_turn
			if win?
				msg = "Player #{@player_turn.to_i + 1} wins!"
				return msg
			end
			if @player_turn == '0'
				@player_turn = '1'
			else
				@player_turn = '0'
			end
	end

#Win condition checks	
	def win?
		if horizontal_win? || vertical_win? || ascending_descending_win?
			return true
		else
			return false
		end
	end

	def horizontal_win?
		@board.each do |col|
		(0..3).each do |index|
			if @player_turn == '0'
				won = col[index..(index + 3)].all? { |pin| pin == col[index] && !pin.nil? && pin == '0' }
			else
				won = col[index..(index + 3)].all? { |pin| pin == col[index] && !pin.nil? && pin == '1' }
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
			if @player_turn == '0'
				won = col[index..(index + 3)].all? { |pin| pin == col[index] && !pin.nil? && pin == '0' }
			else
				won = col[index..(index + 3)].all? { |pin| pin == col[index] && !pin.nil? && pin == '1' }
			end
			return true if won
		end
		end
			return false
	end
	
	def ascending_descending_win?
		valarr = ascender_descender
		valarr.each do |item|
			if item.all?(@player_turn)
				return true
			end
		end
		return false
	end

	def ascender_descender
	answers = []
	ascendarr = []
	descendarr = []
	y = 0
	x = 3
	z = 3
	until y == 3 do
		until x == 7 do
			4.times do |i|
				ascendarr << @board[y + i][x - i]
				descendarr << @board[y + i][z + i]
			end
			answers.push(ascendarr.reverse)
			answers.push(descendarr.reverse)
			ascendarr = []
			descendarr = []
			x = x + 1
			z = z - 1
		end
		x = 3
		z = 3
		y = y + 1
	end
	return answers
	end
	
		
#Pretty print to CLI
	def pretty_print
		@board.each do |arr|
			print arr
			print "\n"
		end
	end
end
