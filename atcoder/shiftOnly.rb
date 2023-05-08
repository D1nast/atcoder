arr=[]
count=0
N=gets.chomp.to_i

for i in 1..N do
    arr<<gets.chomp.to_i
end

while arr.all? { |num| num.is_a?(Integer) && num.even? && num>=1 && num <=10**9}
    count +=1
    arr=arr.map  {|num| num / 2}
end

puts count

# /2の余りが奇数の場合に試行回数のカウントをストップする
# 配列の数字が偶数の間は処理を繰り返す。終了後に繰り返した回数をputs
# https://atcoder.jp/contests/abs/tasks/abc081_b