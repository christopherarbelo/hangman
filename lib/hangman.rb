# frozen_string_literal: true

require_relative 'word_base.rb'
require_relative 'game.rb'

# Hangman class
class Hangman < Game
  include WordBase
  attr_accessor :board, :strikes, :letters
  attr_reader :word, :max_strikes

  def initialize
    super
  end

  def initialize_game
    @word = get_word(5, 12)
    @board = Array.new(word.length) { '_' }
    @max_strikes = 5
    @strikes = 0
    @letters = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
  end

  def play_game
    initialize_game
    until game_over?
      show_board
      guess = guess_letter
      right_guess?(guess) ? update_board(guess, word) : self.strikes += 1
      letters.delete guess
    end
    self.games += 1
    display_score
  end

  def update_board(guess, word)
    word.split('').each_with_index do |char, index|
      board[index] = char if guess == char
    end
  end

  def right_guess?(guess)
    word.include?(guess)
  end

  def game_over?
    if board.join == word
      puts "GOT IT! #{word}"
      self.wins += 1
      true
    elsif max_strikes == strikes
      puts 'Ya Lost :('
      puts "Correct word: #{word}"
      true
    end
  end

  def show_board
    puts "\nBoard: #{board.join(' ')}\tStrikes: #{strikes}/#{max_strikes}\n\n"
  end

  def guess_letter
    loop do
      print "Guess a letter #{letters.join(' ')}: "
      input = gets.chomp.downcase
      return input if letters.include? input
    end
  end
end
