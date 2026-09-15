# Union Findの基礎構文
# https://atcoder.jp/contests/atc001/tasks/unionfind_a

class UnionFind
  def initialize(size)
    @rank = Array.new(size, 0) # ノードのランクを設定
    @parent = Array.new(size, &:itself) # itselfで配列分0indexで記述してくれる
  end

  def unite(id_x, id_y)
    x_parent = get_parent(id_x)
    y_parent = get_parent(id_y)
    return if x_parent == y_parent
    puts "rankX:#{@rank[x_parent]} rankY:#{@rank[y_parent]}"
    # ランクの高いノードに低いノードをつける
    if @rank[x_parent] > @rank[y_parent]
      @parent[y_parent] = x_parent
      puts @parent.inspect
    else
      @parent[x_parent] = y_parent
      @rank[y_parent] += 1 if @rank[x_parent] == @rank[y_parent]
    end
  end

  def get_parent(id_x)
    # 三項演算子で Trueなら id_xをreturn Falseなら右
    @parent[id_x] == id_x ?  id_x : (@parent[id_x] = get_parent(@parent[id_x]))
  end

  def same_parent?(id_x, id_y)
    get_parent(id_x) == get_parent(id_y)
  end
end


# ノードの数、クエリの数を受け取る
n, q = gets.split.map(&:to_i)
union = UnionFind.new(n)

# クエリの回数だけ、入力受け取りを回す
q.times do
  k = gets.split.map(&:to_i)
  if k[0] == 0 # 0なら結合操作を行う
    union.unite(k[1],k[2])
  else # 1なら連結か判定して出力をする
    puts union.same_parent?(k[1],k[2]) ? 'Yes' : 'No'
  end
end
