def diceStreakGamble(player1, player2, player3, player4)
  def calculate_streak(player)
    max_streak = 0
    current_streak = 0
    start_index = 0
    max_start_index = 0

    player.each_with_index do |dice, index|
      if index == 0 || player[index - 1] <= dice
        current_streak += 1
      else
        current_streak = 1
        start_index = index
      end

      if current_streak > max_streak
        max_streak = current_streak
        max_start_index = start_index
      end
    end

    [max_streak, max_start_index]
  end

  players = [player1, player2, player3, player4]
  results = players.map { |player| calculate_streak(player) }

  max_streak, player_index = results.each_with_index.max_by { |result, _| result[0] }
  winning_player = player_index + 1
  winning_amount = max_streak[0] * 4
  winning_rolls = players[player_index][max_streak[1], max_streak[0]]

  "Winner: Player #{winning_player} won $#{winning_amount} by rolling [#{winning_rolls.join(",")}]"
end


# dicestreak2の見本