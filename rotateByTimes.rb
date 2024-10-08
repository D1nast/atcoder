def rotateByTimes(ids,n)


  size = ids.size
  # n回の回転を配列の範囲内に収めるため、nをsizeで割った余りを取る
  n = n % size  
  # 回転した配列を返す
  rotated = ids[-n..-1] + ids[0...-n]    
  return rotated

    
end
