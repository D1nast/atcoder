# dicestreak2の見本
#以下はあなたのコードのレビューです。

# 良い点


# 基本的なロジックの理解: 各プレイヤーのサイコロの目を順に確認し、バーストするかどうかを判定するロジックは正しく実装されています。

# シンプルな構造: 各プレイヤーの処理が同じ構造で書かれており、理解しやすいです。


# 改善点


# コードの重複: 各プレイヤーの処理がほぼ同じコードで繰り返されています。これを関数化して共通化することで、コードの重複を減らし、可読性を向上させることができます。

# インデックスの管理: p1Index, p2Index, p3Index, p4Index の管理が少し冗長です。バーストした位置を記録するのではなく、連続した最大の部分配列を直接追跡する方法を考えると良いでしょう。

# 変数名の改善: p1count, p2count などの変数名は、何をカウントしているのかが明確ではありません。maxStreakLength などのより具体的な名前を使用すると良いでしょう。


# 改善例

# 以下は、コードの重複を減らし、可読性を向上させた例です。

def diceStreakGamble(player1, player2, player3, player4)
  players = [player1, player2, player3, player4]
  max_winnings = 0
  winner = 0
  winning_sequence = []

  players.each_with_index do |player, index|
    current_streak = []
    max_streak = []
    player.each_with_index do |dice, i|
      if i == 0 || player[i - 1] <= dice
        current_streak << dice
      else
        current_streak = [dice]
      end
      if current_streak.length > max_streak.length
        max_streak = current_streak.dup
      end
    end
    winnings = max_streak.length * 4
    if winnings > max_winnings
      max_winnings = winnings
      winner = index + 1
      winning_sequence = max_streak
    end
  end

  "Winner: Player #{winner} won $#{max_winnings} by rolling [#{winning_sequence.join(",")}]"
end

# 結論

# この改善例では、各プレイヤーの処理をループで共通化し、コードの重複を減らしました。また、最大の連続部分配列を追跡することで、インデックスの管理を簡素化しました。これにより、コードの可読性と保守性が向上しています。
