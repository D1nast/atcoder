n = gets.to_i
# 二次元配列{gets.split.map}で二次元配列に
a = Array.new(n) { gets.split.map(&:to_i) }
# 配列の最後の要素を作成
c = a.map(&:last)
# 配列の最初の要素を作成
a = a.map(&:first)

is = (0...n).to_a
# aの攻撃力を降順にするために使う
# {}ブロックで各aの攻撃力を判定→攻撃力順で計算
# 以下の例なら is = [4,2,0,1,3]になる
# {|i| -a[i]}で攻撃力が高いとマイナスの値が大きくなるから
# 例）５なら-5になる
#　a = [3, 1, 4, 1, 5]
# is = [0, 1, 2, 3, 4]  # 元のインデックス

is.sort_by! { |i| -a[i] }



ans = []
is.each do |i|
  if ans.empty? || c[ans.last] > c[i]
    ans << i
  end
end

ans.sort!
puts ans.size
puts ans.map { |i| i + 1 }.join(' ')
