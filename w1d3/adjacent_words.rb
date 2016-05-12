require 'set'
require 'byebug'

class WordChains
  attr_reader :dictionary

  def initialize(dictionary = './dictionary.txt')
    @dictionary = Set.new(File.readlines(dictionary).map(&:chomp))
  end

  def adjacent_words(word)
    results = []
    word.each_char.with_index do |char, idx|
      body = word[0...idx].to_s + '\w' + word[idx+1..-1].to_s
      pattern = /\A#{body}\z/
      found = @dictionary.select { |word| pattern.match(word) }
      results += found
    end
    results
  end
end
