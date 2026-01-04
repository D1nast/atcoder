q = int(input())
A = []          # list → A
index = 0

for _ in range(q):
    ans = 0
    query = list(map(int, input().split()))  # input → query

    if query[0] == 1:
        A.append([query[1], query[2]])
    else:
        if A[index][0] >= query[1]:
            ans += A[index][1] * query[1]
            A[index][0] -= query[1]
            if A[index][0] == 0:
                index += 1
            print(ans)
        else:
            ans += A[index][1] * A[index][0]
            query[1] -= A[index][0]
            index += 1

            while query[1] > 0:
                if A[index][0] >= query[1]:
                    ans += A[index][1] * query[1]
                    A[index][0] -= query[1]
                    if A[index][0] == 0:
                        index += 1
                    break
                else:
                    ans += A[index][1] * A[index][0]
                    query[1] -= A[index][0]
                    index += 1

            print(ans)
