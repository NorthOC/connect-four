require_relative './game.rb'

def new_game

	system('clear')
	puts "Welcome to connect-four!"
	game = Game.new
	until game.win? == true do
		game.pretty_print
		print "\nPlayer #{game.player_turn.to_i + 1} place a pin (1-7): "
		num = gets.chomp.to_i
		until num >= 1 && num <= 7 do
			num = gets.chomp.to_i
		end
		game.place_pin(num)
		system('clear')
	end
		puts "Player #{game.player_turn.to_i + 1} wins!"
		print "Try again?(y/n): "
		answer = gets.chomp
		if answer == 'y'
			new_game
		else
			return 0
		end
end

new_game	
