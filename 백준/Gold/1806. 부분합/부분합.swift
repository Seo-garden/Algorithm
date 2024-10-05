let NS = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NS[0]
let S = NS[1]
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}

var end = 0
var sum = 0
var count = 0
var result = Int.max

for start in 0..<N {
    while sum < S && end < N {
        sum += arr[end]
        end += 1
        count += 1
    }
    if sum >= S {
        result = min(result, count)
    }
    sum -= arr[start]
    count -= 1
}
print(result == Int.max ? 0 : result)