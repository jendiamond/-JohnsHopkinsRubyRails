require 'pry'
class LineAnalyzer

  attr_reader :content,
              :line_number,
              :highest_wf_count,
              :highest_wf_words

  def initialize(content, line_number)
    @content = content
    @line_number = line_number
    calculate_word_frequency
  end

  def highest_wf_words
    word_frequency = Hash.new(0)
    (@content.chomp.split).each do |word|
      word_frequency[word.downcase] += 1
    end
    word_frequency
  end

  def highest_wf_count
    highest_wf_words.values.max
  end

  def calculate_word_frequency
    highest_wf_words
    highest_wf_count
  end
end

class Solution
  attr_reader :analyzers,
              :highest_count_across_lines,
              :highest_count_words_across_lines

  def initialize
    @analyzers = []
    @highest_count_across_lines = nil
    @highest_count_words_across_lines = []
  end

  def analyze_file
    count = 0
    File.foreach('test.txt') do |line|
      @line_analyzer = LineAnalyzer.new(line, count)
      @analyzers.push(@line_analyzer)
      count += 1
    end
  end

  def highest_count_words_across_lines
    analyze_file
    @analyzers.each do |line|
      each = line.calculate_word_frequency
       @highest_count_across_lines << each
    end
  end

  def calculate_line_with_highest_frequency
    analyze_file
    @analyzers.each do |line|
      each = line.calculate_word_frequency
      @highest_count_words_across_lines << each
    end
    
  end

  def print_highest_word_frequency_across_lines
    # "The following words have the highest word frequency per line:\n 
    # #{["word1"]} (appears in line ##{line)})\n
    # #{["word2", "word3"]} (appears in line ##{line)})"
  end

end

solution = Solution.new
solution.analyze_file
solution.calculate_line_with_highest_frequency
solution.highest_count_words_across_lines
solution.print_highest_word_frequency_across_lines

