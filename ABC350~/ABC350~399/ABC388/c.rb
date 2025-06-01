n = gets.to_i
a = gets.split.map(&:to_i)
b = []
ans = 0
a.each {|num| b << num/2}
b.each do |i|

  left = 0
  right = n-1

  while right - left > 1
    mid = ( left+right ) / 2
    # 中央の値が探している値以上だった場合は、rightをmid（leftだとバグる）
    # s[mid] >= num　ということは numはs[mid]==num か、それ未満の数字ということになるから
    if a[mid] >= i
      right = mid
    else
      left = mid
    end
  end
end
puts b.inspect

