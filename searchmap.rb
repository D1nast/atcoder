def searchList(numList,value)
  # 関数を完成させてください
  puts numList.size
  hashmap = {}
  i = 0
  while i < numList.size do
      hashmap[numList[i]] = numList[i];
      i += 1
  end
  puts value
  puts hashmap
  if hashmap[value]
    # return hashmap.keys.index(value)
    puts hashmap.keys.index(value)
  else
    # return -1
    puts -1
  end

end

searchList([3,10,23,3,4,50,2,3,4,18,6,1,-2],18)

# hash = {a: 1, b: 2, c: 3}

# # キー :b のインデックスを取得
# index = hash.keys.index(:b)
# puts index #=> 1

# hash = {a: 1, b: 2, c: 3}

# # 値 2 のインデックスを取得
# index = hash.val
# ues.index(2)
# puts index #=> 1
