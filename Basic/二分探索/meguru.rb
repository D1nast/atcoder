# めぐる式二分探索
# https://qiita.com/drken/items/97e37dd6143e33a64c8c
def seller(sell,n,i)
  left = -1
  right = n
  while right - left > 1
    mid = left + ( right-left ) / 2 
    if sell[mid] >= sell[i]
      right = mid
    else
      left = mid
    end
  end
  return right
end
