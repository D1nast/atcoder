import bisect
import sys
input = sys.stdin.readline

n, q = map(int, input().split())
a = list(map(int, input().split()))
a.sort()
def b_search(k):
    return k - bisect.bisect_right(a, k)

for _ in range(q):
    x, y = map(int, input().split())
    base = b_search(x - 1)
    low, high = x, 10**18
    while low < high:
        mid = (low + high) // 2
        if b_search(mid) >= base + y:
            high = mid
        else:
            low = mid + 1

    print(low)
