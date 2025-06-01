require 'set'
n,k = gets.split.map(&:to_i)
s = gets.chomp.chars
set1 = Set.new
# set2 = Set.new

# Nの階乗で全列挙
s.permutation do |item|
  count = 0
  # set1.add(item)
  (0...n).each do |i|
    break if i + k > n
    dup = item[i...(i+k)].dup
    left = 0
    right = i+k-1
    k.times do
      dup[left] = item[right]
      left += 1
      right -= 1
    end
    if dup != item[i...(i+k)]
      count += 1
      # set2.add(item)
      # break
    end
  end
  set1.add(item) if count == n-k+1
end 

# puts set1.size - set2.size
puts set1.size


# 以下生成AIにC++に変換してもらったコードならTLEせずに通る
# // main.cpp
# #include <iostream>
# #include <vector>
# #include <set>
# #include <algorithm>

# using namespace std;

# int main() {
#     int n, k;
#     cin >> n >> k;
    
#     string s;
#     cin >> s;
    
#     set<string> set1; // set1: 全ての並べ替え
#     set<string> set2; // set2: 長さ K の回文部分文字列を含む並べ替え
    
#     // s の全ての順列を求める
#     sort(s.begin(), s.end());
#     do {
#         // 並べ替えた文字列を set1 に追加
#         set1.insert(s);
        
#         // 長さ k の部分文字列に回文が含まれているかをチェック
#         for (int i = 0; i <= n - k; ++i) {
#             string substring = s.substr(i, k);
#             string reversed_substring = substring;
#             reverse(reversed_substring.begin(), reversed_substring.end());
            
#             if (substring == reversed_substring) {
#                 set2.insert(s);
#                 break;
#             }
#         }
#     } while (next_permutation(s.begin(), s.end())); // 次の順列を生成
    
#     // 結果を出力
#     cout << set1.size() - set2.size() << endl;
    
#     return 0;
# }
