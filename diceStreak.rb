def diceStreakGamble(player1,player2,player3,player4)

    ans = []
    p1count = 0
    p1Index = []
    p2count = 0
    p2Index = []
    p3count = 0
    p3Index = []
    p4count = 0
    p4Index = []

    player1.each_with_index do |dice,index|
        temp = player1[index-1] if index !=0
        if index == 0
            p1count += 1
        elsif temp > dice
            p1count = 1
            p1Index << index
        else
            p1count += 1
        end
    end
    player2.each_with_index do |dice,index|
      temp = player2[index-1] if index !=0
        if index == 0
            p2count += 1
        elsif temp > dice
            p2count = 1
            p2Index << index
        else
            p2count += 1
        end
    end
    player3.each_with_index do |dice,index|
      temp = player3[index-1] if index !=0
        if index == 0
            p3count += 1
        elsif temp > dice
            p3count = 1
            p3Index << index
        else
            p3count += 1
        end
    end
    player4.each_with_index do |dice,index|
      temp = player4[index-1] if index !=0
        if index == 0
            p4count += 1
        elsif temp > dice
            p4count = 1
            p4Index << index
        else
            p4count += 1
        end
    end

    ans << p1count
    ans << p2count
    ans << p3count
    ans << p4count

    if ans.index(ans.max) == 0
      return "Winner: Player 1 won $#{p1count*4} by rolling [#{player1[(p1Index.max)..-1].join(",")}]"
    elsif ans.index(ans.max) == 1
      return "Winner: Player 2 won $#{p2count*4} by rolling [#{player2[(p2Index.max)..-1].join(",")}]"
    elsif ans.index(ans.max) == 2
      return "Winner: Player 3 won $#{p3count*4} by rolling [#{player3[(p3Index.max)..-1].join(",")}]"
    else
       return "Winner: Player 4 won $#{p4count*4} by rolling [#{player4[(p4Index.max)..-1].join(",")}]"
    end
end



# "Winner: Player 3 won $8 by rolling [15, 26]"
# "Winner: Player 3 won $8 by rolling [15,26]"
# 
#