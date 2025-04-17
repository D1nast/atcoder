  def recursion(n,s,t,line,sum,start,count,min)
    if n == count
      min[:current] = [ min[:current],sum ].min
      # puts "sum:#{sum} min:#{min}"
      return
    end
    count += 1
    line[0].permutation.to_a.each do |c|
      sMove = (Math.sqrt( (start[0]-c[0][0])**2 + (start[1]-c[0][1])**2 )) / s 
      tMove = (Math.sqrt( (c[0][0]-c[1][0])**2 + (c[0][1]-c[1][1])**2 )) / t # 照射中の移動
      new_sum = sum + sMove + tMove
      recursion(n,s,t,line[1..-1],new_sum,c[1],count,min)
    end

  end

  n,s,t = gets.split.map(&:to_i)
  line = []
  min = {current:Float::INFINITY}
  n.times do
  input = gets.split.map(&:to_i)
  line << [ [input[0],input[1]],[input[2],input[3]] ]
  end

  # 線分の組み合わせ
  line.permutation.to_a.each do |query|
    query[0].permutation.each do |c|
      # puts c.inspect
      sMove = (Math.sqrt ( (c[0][0])**2 + (c[0][1])**2 ) ) / s
      tMove = (Math.sqrt((c[0][0]-c[1][0]) **2 + (c[0][1]-c[1][1])**2)) / t
      sum = sMove + tMove
      recursion(n,s,t,query[1..-1],sum,c[1],1,min)
    end
  end


  puts min[:current]


# puts Math.sqrt(1**2+1**2)/2 ユークリッド距離