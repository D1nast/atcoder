def missingItems(listA,listB)
  # 関数を完成させてください
  ans = []
  hashMap = {}
  i = 0

  while listB.size > i do
      hashMap[listB[i]] = listB[i]
      i += 1
  end

  listA.map do |list|
      if hashMap[list] != list
        ans.push(list)
      end
  end
  return ans
end

missingItems([1,2,3,4,5,6,7,8],[1,3,5])

ハッシュマップには