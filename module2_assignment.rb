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
    @highest_count_across_lines = []
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
    @analyzers.each do |line|
      highest_words__per_line = line.highest_wf_words
      @highest_count_across_lines << highest_words__per_line
    end
    @highest_count_across_lines
 #    highest
 # #     highest = highest.values.max
 # #     @highest_count_across_lines << highest
 # #   end
 # #   maxval = @highest_count_across_lines.max
  end

  def calculate_line_with_highest_frequency
  #  words_found = []
  #  @highest_count_across_lines.each do |line|
  #    line.select do |key,value|
  #      if  value == 4
  #        words_found << key
  #      end
  #    end
  #  end
  #  words_found
  end

  def print_highest_word_frequency_across_lines
    
  end
end


solution = Solution.new


puts "solution.analyzers.length..."
p solution.analyzers.length
puts "solution.analyze_file equals..."
p solution.analyze_file
puts
puts "solution.analyzers.length..."
p solution.analyzers.length
puts "Solution after"
p solution

puts "solution.highest_count_words_across_lines"
p solution.highest_count_words_across_lines

# puts "solution equals..."
# p solution

#a = LineAnalyzer.new

# puts solution.analyzers
# puts
# puts "solution.highest_count_across_lines..."
# p solution.highest_count_across_lines
# puts
# puts "solution.calculate_line_with_highest_frequency..."
# p solution.calculate_line_with_highest_frequency
# puts
# puts "solution.highest_count_across_lines..."
# p solution.highest_count_across_lines
# puts
# puts
# puts "solution.highest_count_words_across_lines..."
# p solution.highest_count_words_across_lines
# puts
# puts "solution.highest_count_words_across_lines..."
# p solution.highest_count_words_across_lines
# puts "solution.calculate_line_with_highest_frequency..."
# p solution.calculate_line_with_highest_frequency
# puts
# puts
