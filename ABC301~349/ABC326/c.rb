def bsearch(a,i,n,searchR) # 配列の中でx以上の値の最小のインデックスを返す
  left = -1
  right = n
  while right - left > 1
    mid = left + ( right-left ) / 2 
    if a[mid] >= searchR
      right = mid
    else
      left = mid
    end
  end
  return right
end

n,m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i).sort
max = 0
(0...n).each do |i|
  searchR = a[i] + m - 1
  if a[i] == searchR
    # 左端=右端だった場合（例：left=1 right=1）
    max = [ max,bsearch(a,i,n,searchR+1) - i ].max
  else
    # 右端=searchRだった場合
    if a[bsearch(a,i,n,searchR)] == searchR
      max = [ max,bsearch(a,i,n,searchR) - i + 1].max
    else
    # 右端 > serchRだった場合（右端:11,searchR:9の場合）
      max = [ max,bsearch(a,i,n,searchR) - i ].max
    end
  end
end
puts max
# puts a.inspect


# N * logN
# 頭から線形探索して、獲得できるプレゼントの数を二分探索する
