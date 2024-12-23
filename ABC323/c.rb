n,m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
point = Array.new(n){0}
wrongA = Array.new(n){[]}
max = 0
count = 0

(0...n).each do |i|
  s = gets.chomp
  (0...m).each do |j|
    point[i] += a[j] if s[j] == "o"
    wrongA[i] << -a[j] if s[j] == "x"
  end
  point[i] += i+1
  wrongA[i].sort!
  max = [max,point[i]].max
end

(0...n).each do |i|
  if max - point[i] > 0
    wrongA[i].each do |j|
      count += 1
      point[i] -= j
      if max - point[i] < 0 
        puts count
        break
      end
    end
    count = 0
  else
    puts 0
  end
end