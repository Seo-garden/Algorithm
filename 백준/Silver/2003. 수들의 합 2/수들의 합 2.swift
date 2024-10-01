let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]

let inputArr = readLine()!.split(separator: " ").map { Int($0)! }

var start = 0
var end = 0
var sum = 0
var count = 0

while end < N {
    if sum < M {
        sum += inputArr[end]
        end += 1
    }
    while sum >= M {
        if sum == M {
            count += 1
        }
        sum -= inputArr[start]
        start += 1
    }
}

print(count)