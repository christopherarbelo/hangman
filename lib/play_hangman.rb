# frozen_string_literal: true

require_relative 'hangman'

game = Hangman.new
puts 'Hangman initiated'
puts 'Rules'
puts '- You have 5 tries to guess the word correctly'
puts '- Correct guesses doesn\'t count as a try'
loop do
  game.play_game
  print "\nEnter 'play' to keep playing: "
  break unless gets.chomp.downcase == 'play'
end
