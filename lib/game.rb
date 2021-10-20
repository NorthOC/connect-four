class String
def black;          "\e[30m#{self}\e[0m" end
def red;            "\e[31m#{self}\e[0m" end
def green;          "\e[32m#{self}\e[0m" end
def brown;          "\e[33m#{self}\e[0m" end
def blue;           "\e[34m#{self}\e[0m" end
def magenta;        "\e[35m#{self}\e[0m" end
def cyan;           "\e[36m#{self}\e[0m" end
def gray;           "\e[37m#{self}\e[0m" end
end

class Game
	attr_reader :board, :player_turn

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
		bullet = "●"
		@board.each do |arr|
			print "|"
			arr.each do |item|
				if item == '0'
					print " #{bullet.blue}  "
				elsif item == '1'
					print " #{bullet.red}  "
				else
					print ' ○  '
				end
			end
			print "|"
			print "\n"
		end
		print "  1   2   3   4   5   6   7  "
	end
end
