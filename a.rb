def fallingDistance(planet,time)
  # gを返す関数
  def returnGravity(planet)
      if planet == "Earth"
          return 9.8
      elsif planet == "Jupiter"
          return 24.79
      elsif planet == "Mercury"
          return 3.7
      else
          return 0
      end
  end

  def cal(g,t)
      mile =0.000621371
      return 0.5*g*t**2*mile
  end

   puts cal(returnGravity(planet),time).floor

end

fallingDistance("Earth",5000)