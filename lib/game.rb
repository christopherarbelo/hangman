# frozen_string_literal: true

# General Game Class
class Game
  attr_accessor :games, :wins
  def initialize
    @games = 0
    @wins = 0
  end

  def display_score
    puts "\n-Score-\nWins: #{wins} Games Played: #{games}"
  end
end
