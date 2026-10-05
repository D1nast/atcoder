n,q = list(map(int,input().split()))

pigeon = {}
nest_ref = {}
nest = {}

for i in range(n):
    pigeon.setdefault(i+1,i+1)
    nest_ref.setdefault(i+1,i+1)
    nest.setdefault(i+1,i+1)

for i in range(q):
    query = list(map(int,input().split()))
    if query[0]==1:
        pigeon[query[1]] = nest[query[2]]
    elif query[0]==2:
        nest_ref[query[1]],nest_ref[query[2]] = nest_ref[query[2]],nest_ref[query[1]]
        nest[query[1]],nest[query[2]] = nest[query[2]],nest[query[1]]
    else:
        print(nest_ref[pigeon[query[1]]])


# print(pigeon,nest_ref,nest)