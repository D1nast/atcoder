class Animal
    def initialize(name, weightKg, heightM, isPredator, speedKph)
      @name = name
      @weightKg = weightKg
      @heightM = heightM
      @isPredator = isPredator
      @speedKph = speedKph
    end
  
    def activityMultiplier
      1.2
    end
  
    def getBmi
      bmi = @weightKg / (@heightM ** 2)
      puts "Raw BMI: #{bmi}"  # デバッグ: 生のBMI値を表示
      truncated_number = bmi.round(2)
      puts "Rounded BMI: #{truncated_number}"  # デバッグ: 丸めた後のBMI値を表示
      truncated_number
    end
  
    def getDailyCalories
      dc = 70 * @weightKg ** 0.75 * activityMultiplier
      puts "Raw Daily Calories: #{dc}"  # デバッグ: 生のカロリー値を表示
      formatted_dc = dc.round(2)
      puts "Rounded Daily Calories: #{formatted_dc}"  # デバッグ: 丸めた後のカロリー値を表示
      formatted_dc
    end
  
    def isDangerous
      @isPredator || @heightM >= 1.7 || @speedKph >= 35
    end
  end
  
  # テストケース
  rabbit = Animal.new("rabbit", 10, 0.3, false, 20)
  puts rabbit.getBmi  # 期待される出力: 33.33
  
  snake = Animal.new("snake", 30, 1, true, 30)
  puts snake.isDangerous 
  puts snake.getDailyCalories  # 期待される出力: 336.74
  
  elephant = Animal.new("elephant", 300, 3, false, 5)
  puts elephant.getBmi  # 期待される出力: 33.33
  puts elephant.getDailyCalories  # 期待される出力: 2002.0
  
  gazelle = Animal.new("gazelle", 50, 1.5, false, 100)
  puts gazelle.getDailyCalories  # 期待される出力: 1716.56
  puts gazelle.isDangerous 
  