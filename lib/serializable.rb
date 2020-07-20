# frozen_string_literal: true

require 'msgpack'

# Seriablizable module to save game
module Serializable
  def save
    str = serialize
    Dir.mkdir 'memory' unless File.exist? 'memory'
    File.open('memory/saved_game.txt', 'w') { |file| file.write str }
    puts 'Saved game!'
    true
  end

  def load
    return unless File.exist? 'memory/saved_game.txt'

    unserialize File.read 'memory/saved_game.txt'
    delete
    puts 'Loaded Game'
    true
  end

  def serialize
    obj = {}
    instance_variables.map do |variable|
      obj[variable] = instance_variable_get(variable)
    end

    MessagePack.dump obj
  end

  def unserialize(str)
    hash = MessagePack.load(str)
    hash.keys.each do |key|
      instance_variable_set(key, hash[key])
    end
  end

  def delete
    File.delete 'memory/saved_game.txt'
  end
end
