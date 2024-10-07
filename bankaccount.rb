class BankAccount

  def initialize(bankName,ownerName,savings)
      @bankName = bankName
      @ownerName =ownerName
      @savings =savings
  end

  def depositMoney(depositAmount)
      if @savings <= 20000
          @savings = @savings - 100 + depositAmount
      else
          @savings = @savings + depositAmount
      end
  end
  #  2万ドル以下の場合は１００ドルの手数料

  def withdrawMoney(withdrawAmount)
    def float
      calc = @savings * 0.2
      return calc.floor
    end
      if (@savings* 0.2) < withdrawAmount
          @savings = @savings - float
      else
          @savings = @savings - withdrawAmount
      end
  end
  # 貯金額の２０％まで
  def pastime(days)
      @savings = @savings + (0.25*days)
  end
  
end

user1 = BankAccount.new("Chase", "Claire Simmmons", 30000)
puts  user1.withdrawMoney(2000)
puts  user1.depositMoney(10000)
puts  user1.pastime(93)
  
user2 = BankAccount.new("Bank Of America", "Remy Clay", 10000)
puts user2.withdrawMoney(5000)
# 5000が問題で小数点が出ている
puts user2.depositMoney(12000)
puts user2.pastime(505) 