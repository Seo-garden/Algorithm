var N = Int(readLine()!)!
var arr = [Int]()
var count = Int.max

// 1차원 배열 초기화
for _ in 0..<N {
    let input = readLine()!.map({ $0 == "H" ? 0 : 1 })
    arr.append(contentsOf: input)
}

// 모든 경우의 수 반복
for row in 0..<(1 << N) {
    var sum = 0
    for j in 0..<N {
        var zeroCount = 0
        for i in 0..<N {
            let flippedBit = (row >> i) & 1 == 1 ? 1 - arr[i * N + j] : arr[i * N + j]
            zeroCount += flippedBit == 0 ? 1 : 0
        }
        sum += min(zeroCount, N - zeroCount)
    }
    count = min(count, sum)
}

print(count)
