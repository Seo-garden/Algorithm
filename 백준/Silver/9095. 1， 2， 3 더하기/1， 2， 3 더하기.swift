let T = Int(readLine()!)!
var arr = [Int]()

var count = 1
for _ in 0..<T {
    let n = Int(readLine()!)!
    arr.append(n)
}

var dpArr = [Int](repeating: 0, count: 11)

func dp(_ num: Int) -> Int {
    if dpArr[num] != 0 {
        count += dpArr[num]
        return dpArr[num]
    }
    
    if num == 0 {
        count += 1
        return 1
    }
    if num == 1 {
        count += 1
        return 1
    }
    if num == 2 {
        count += 2
        return 2
    }
    if num == 3 { 
        count += 4
        return 4
    }
    
    dpArr[num] = dp(num-1) + dp(num-2) + dp(num-3)
    return dpArr[num]
}

for i in 0..<T {
    let result = dp(arr[i])
    print(result)
}