def add(numbers)
    delimiter = ','

    if numbers.start_with?("//")
        delimiter_line, numbers = numbers.split("\n", 2)
        delimiter = delimiter_line[2..-1]
    end
    nums = numbers.split(/#{Regexp.escape(delimiter)}|\n/)
    negatives = nums.select { |num| num.to_i < 0 }

    if negatives.any?
        raise "Negative numbers not allowed: #{negatives.join(',')}"
    end

    nums.map(&:to_i).inject(0) { |sum, num| num <= 1000 ? sum + num : sum }
end

puts add("")          
puts add("1")         
puts add("1,5")      
puts add("1\n2,3")   
puts add("//;\n1;2") 
