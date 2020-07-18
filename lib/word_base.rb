# frozen_string_literal: true

# WordBase module
module WordBase
  def get_word(min, max)
    word_file = File.readlines '5desk.txt'
    word_file.map! { |word| word.sub("\r\n", '') }
    words = word_file.filter { |word| min <= word.length && word.length <= max }
    words.sample
  end
end
