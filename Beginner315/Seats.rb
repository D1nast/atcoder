N = gets.to_i
S = gets.to_s


# 「#.#」の並びがSの文字列の中にいくつあるのか
i = 0
count = 0

while i < N do
  if S[i] == "#" && S[i+1] == "." && S[i+2] == "#"
    count += 1
  end
  i += 1
end
puts count