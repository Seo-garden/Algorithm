let N = Int(readLine()!)!
let input = readLine()!.split(separator: " ").compactMap{ Int($0) }

if N == 1 {
    // 수열의 길이가 1인 경우, 결과는 당연히 1
    print(1)
} else {
    var increaseCount = 1
    var decreaseCount = 1
    var maxCount = 1
    
    for i in 1..<N {
        if input[i] > input[i - 1] {
            increaseCount += 1
            decreaseCount = 1
        } else if input[i] < input[i - 1] {
            decreaseCount += 1
            increaseCount = 1
        } else {
            // 연속된 숫자의 경우 두 카운트 모두 증가
            increaseCount += 1
            decreaseCount += 1
        }
        maxCount = max(maxCount, increaseCount, decreaseCount)
    }
    
    print(maxCount)
}