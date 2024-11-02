# N = gets.chomp.to_i
# queryN = []
# N.times do 
#   queryN << gets.chomp.split.map(&:to_i)
# end

# Q = gets.chomp.to_i
# question = []
# Q.times do
#    question << gets.chomp.split.map(&:to_i)
# end

# question.each do |q|
#   # クエリQの日<querNの日以下 かつ クエリQの日 % クエリNの日が3以下
#   i = q[0]-1
#   if q[1] <= queryN[i][0] && q[1] % queryN[i][0] <= queryN[i][1] 
#     puts queryN[i][1]
#   elsif q[1] % queryN[i][0] <= queryN[i][1]
#     puts q[1] + (queryN[i][1] - q[1] % queryN[i][0]) 
#   elsif q[1] / queryN[i][1] == 0
#     puts queryN[i][0] + queryN[i][1]
#   else
#     tmp = (q[1]/queryN[i][0]) + 1 
#     puts queryN[i][0] * tmp + queryN[i][1]
#   end
# end
#
#↑上は自分が書いたコード 
N = gets.to_i
q = Array.new(N)
r = Array.new(N)

N.times do |i|
  q[i], r[i] = gets.split.map(&:to_i)
end

Q = gets.to_i
Q.times do
  t, d = gets.split.map(&:to_i)
  t -= 1
  b, c = d.divmod(q[t])
  a = c <= r[t] ? b : b + 1
  ans = a * q[t] + r[t]
  puts ans
end
