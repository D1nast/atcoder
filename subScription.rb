def validEmailList(emailList)
  arr=[]
  def isEmailValid(email)
      count = email.count("@")
      strIndex = email.index("@")
      slice = email.slice(strIndex..-1)

      if email.include?(" ") || count > 1 || strIndex == 0 || !slice.include?(".")
          return false
      else
          return true
      end
  end

  emailList.each{ |email|
      if isEmailValid(email)
          arr << email
      else
          puts "no"
      end
  }
  return arr

end

# スペースがないこと → include?
# 「@」を 1 つのみ含んでいること email.count("@") >1
# 「@」の後に「.」があること 
# 「@」から始まらないこと strIndex == 0