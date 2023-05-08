ans=[]
s1=gets.chomp.to_i
s2=gets.chomp.to_i
s3=gets.chomp.to_i

ans.push(s1,s2,s3)
count = ans.count {|ans| ans >= 2}

if count==0
    puts ans.count(1)
end


# ２以上の整数があると出力されない＝＝制約