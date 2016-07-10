require 'pry'

def sample
  arr = (1..10000).to_a.sample(23)
end

def divisible_by_three
  arr.select { |element| element % 3 == 0 }
end

def divisible_by_three_sample_in_reverse
  result = []
  (1..10000).each do |num|
    if num % 3 == 0 && num > 5000
      result << num
    end
  binding.pry
  end
  result.reverse
end

p divisible_by_three_sample_in_reverse

