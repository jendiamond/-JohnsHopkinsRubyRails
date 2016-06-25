class LineAnalyzer

  attr_reader :content,
              :line_number,
              :highest_wf_count,
              :highest_wf_words

  def initialize(content, line_number)
    @content = content
    @line_number = line_number
    @calculate_word_frequency = calculate_word_frequency
  end

  def highest_wf_words
    word_frequency = Hash.new(0)
    (content.split).each do |word|
      word_frequency[word.downcase] +=1
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



  # Implement the analyze_file() method() to:
  #* Read the 'test.txt' file in lines 
  #* Create an array of LineAnalyzers for each line in the file

  def analyze_file(file)
    @analyzers = []
    File.open(file, 'r') do |file|
      analyzers = []
      file.each_line do |line|
        analyzers.push(line.chomp)
      end
      analyzers
    end
  end

  def analyzers
    #an array of LineAnalyzer objects 
    #for each line in the file
    analyze_file
  end

  def highest_count_across_lines
    #a number with the maximum value 
    #for highest_wf_words attribute 
    #in the analyzers array.
  end

  def highest_count_words_across_lines
    #a filtered array of LineAnalyzer objects 
    #with the highest_wf_words attribute 
    #equal to the highest_count_across_lines 
    #determined previously.
    #  attribute value determined previously 
    #and stores them in highest_count_words_across_lines.
  end
  
  # determines the highest_count_across_lines and
  # highest_count_words_across_lines attribute values
   #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
  #  and stores this result in the highest_count_across_lines attribute.
  #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines 
  #  attribute value determined previously and stores them in highest_count_words_across_lines.
  def calculate_line_with_highest_frequency()
    @highest_count_words_across_lines = []
    @highest_count_across_lines = 1
    @analyzers.each do |linha|
      if @highest_count_across_lines < linha.highest_wf_count
         @highest_count_across_lines = linha.highest_wf_count
      end   
      if @highest_count_across_lines == linha.highest_wf_count
         @highest_count_words_across_lines << linha
      end
    end
  end

  # prints the values of LineAnalyzer objects in 
  #  highest_count_words_across_lines 
  #  in the specified format
    #Implement the print_highest_word_frequency_across_lines() method to
  #* print the values of objects in highest_count_words_across_lines in the specified format
  def print_highest_word_frequency_across_lines()
    
  end
end
