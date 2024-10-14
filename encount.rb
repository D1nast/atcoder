def findXTimes(teams)
  # 関数を完成させてください
  count = Hash.new(0)
  a = teams.split("")
  a.each do |team|
      count[team] += 1
  end
  
end

findXTimes("babacddc")