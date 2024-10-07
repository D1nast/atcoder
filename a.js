// 総和の再帰関数
function simpleSummation(count){
    // ベースケース
    if(count <= 0 ){
        return 0;
    }

    return count + simpleSummation(count-1);
}

// 総和の総和の再帰関数
function simpleSummationOfSummations(count){
    // ベースケース
    if(count <= 0 ){
        return 0;
    }

    // SS(n) = S(n) + SS(n-1)
    return simpleSummation(count) + simpleSummationOfSummations(count-1);   
}

//  2の場合 
// (2)=2+simSum(1)+simSum(1) → 2＋1
// (1)=1+simSum(0)+simSum(0) → 1
// (0)=return 0 



//  3の場合 
// (3)=3+simSum(3-1)+simSum(3-1) → return 
// (2)=2+simSum(2-1)+simSum(2-1) → return 4(2+1+1)
// (1)=1+simSum(1-1)+simSum(1-1) → return 1(1+0+0)
// (0)=return 0


console.log(simpleSummationOfSummations(4));
console.log(simpleSummationOfSummations(3));
console.log(simpleSummationOfSummations(2));
console.log(simpleSummationOfSummations(10));