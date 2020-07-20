# frozen_string_literal: true

require_relative 'hangman'

game = Hangman.new
puts 'Hangman initiated'
puts 'Rules'
puts '- You have 5 tries to guess the word correctly'
puts '- Correct guesses doesn\'t count as a try'

puts 'Save game/Load game'
puts '- To save game at any time enter \'save\''
puts '- Any previously saved game will load automatically'
puts

loop do
  game.load and game.loaded = true if File.exist? 'memory/saved_game.txt'
  game.play_game
  print "\nEnter 'play' to keep playing or 'exit' to stop: "
  input = gets.chomp.downcase
  exit if input == 'exit'
  break unless input == 'play'
end
