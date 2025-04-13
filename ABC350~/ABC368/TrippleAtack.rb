N = gets.to_i
H = gets.chomp.split.map(&:to_i)
t = 0

H.each do |a|

  num = a/5
  t += num*3
  a -= num*5
  # 初めに数字を４以下まで削っていく。culは、HPを削っていく作業。HPが４以下になるまでは、tが１、２、３いずれでもやることは変わらないので
  # 場合に応じて、カウントを変える
  # puts "5未満処理前:t#{t} a#{a}"
  
  if t % 3 == 0
    if a >= 3
      t += 3
    elsif a == 2
      t += 2
    elsif a == 1
      t += 1
    end
  elsif t % 3 == 1
    if a >= 2
      t += 2
    elsif a == 1
      t += 1
    end
  else
    if a == 4
      t += 2
    elsif a >= 1 && a <=3
      t += 1
    end
  end

  # puts "5未満処理後:t#{t} a#{a}"
end

puts t

# 計算量はO（N）
# Rubyは遅いので、細かい場合分けをしないと処理実行時間を過ぎる