def winnerBlackjack(playerCards,houseCards)
  # 関数を完成させてください
  playerSum = 0
  houseSum  = 0
  playerCards.map do |card|
      slice = card.slice(1..-1)
      puts slice
      if slice == "J" || slice == "Q" || slice == "K" || slice == "A"
          if slice == "J"
              playerSum = playerSum + 11
          elsif  slice == "Q"
              playerSum = playerSum + 12
          elsif   slice == "K"
              playerSum = playerSum + 13
          else
              playerSum = playerSum + 1
          end
      else
          playerSum = playerSum + slice.to_i
      end
  end
  houseCards.map do |card|
      slice = card.slice(1..-1)
      puts slice
      if slice == "J" || slice == "Q" || slice == "K" || slice == "A"
          if slice == "J"
              houseSum = houseSum + 11
          elsif  slice == "Q"
              houseSum = houseSum + 12
          elsif    slice == "K"
              houseSum = houseSum + 13
          else
              houseSum = houseSum + 1
          end
      else
          houseSum = houseSum + slice.to_i
      end
  end

  if playerSum > 21 || playerSum == houseSum
      return false
  elsif houseSum < 22 && houseSum > playerSum
      return false
  else
      return true
  end

end