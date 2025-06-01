s = gets.chomp.chars
stack = []
s.each do |str|

  if str == "(" || str == "[" || str == "<"
    case str
    when "("
      stack << 1
    when "["
      stack << 2
    else
      stack << 3
    end
  else
    pop = stack.pop
    check = 0
    case str
    when ")"
      check = 1
    when "]"
      check = 2
    else
      check = 3
    end

    if pop.nil? || pop != check
      puts "No"
      exit
    end
  end

end

if stack.empty?
  puts "Yes"
else
  puts "No"
end

# puts stack.inspect

