N = gets.to_i
A = gets.split.map(&:to_i)
R = Array.new(N){0}

(0...N).each do |i|
  # 石を渡せない人数の数を継承
  R[i] = R[i] + R[i-1] if i > 0
  
  if i == N-1
    A[i] += i - R[i] - (N - (i+1))     
  else
    # 石の数:A[i]+i - R[i]　渡す石の数:N - (i+1) 
    if A[i]+i - R[i] - (N - (i+1)) < 0 # ある年から渡せなくなる場合
      R[A[i]+i - R[i] - (N - (i+1))] += 1
      A[i] = 0
    else # 最後まで渡せる場合
      A[i] += i - R[i] - (N - (i+1))   
    end
  end
end

puts A.join(" ")