def shuffleSuccessRate(arr,shuffledArr)
  # 関数を完成させてください

  size = arr.size
  count = 0
  i = 0

  while i < size do
      if arr.index(i) == shuffledArr.index(i)
          count += 1
      end
      i += 1
  end

  puts count
  puts size
  puts ((count.to_f/size)*100).floor

end

shuffleSuccessRate([2,32,45],[45,32,2])