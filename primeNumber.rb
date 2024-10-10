def primesUpToNCount(n)
  # n未満の整数で素数の個数
  cashe = []
  i = 0
  while i < n-1 do
      if i == 0
          cashe.push(false)
      else
          cashe.push(true)
      end
      i += 1
  end
  # n = 5なら、1,2,3,4が配列にインデックスは0,1,2,3
  sqrt = Math.sqrt(n).ceil
  currentNumber = 2
  while currentNumber < sqrt + 1 do
    i = 2
    while currentNumber * i < n+1 do
      ip = currentNumber * i - 1
      # 4を消したいのであれば、4-1をインデックスに
      cashe[ip] = false
      i += 1
    end 

    currentNumber += 1
  
  end

  return cashe.count(true)
  
end


# 素数をtrueとする
# n=13
# [1,2,3,4,5,6,7,8,9,10,11,12] 数字の数
# [0,1,2,3,4,5,6,7,8,9,10,11]　インデックス
# [false,true,true,true...12] cashe
# 367からエラーが出る


# n-1が2の場合は、1を返し
# そうでない場合、まず2を素数配列に格納する
# その後


# 5の場合、素数が３とエラーが出る。正当は[1..4]で素数は2と3で「2」が正当　4が素数判定されている

# 1桁の約数で割れなかった数字が素数
# 2,3,5,7