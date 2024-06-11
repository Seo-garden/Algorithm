var input = Int(readLine()!)!
//아래 배열을 초기화하는 방법은 둘중에 아무거나 사용해도 상관없다.
var numberArray = Array(repeating: Array(repeating: 0, count: input), count: input)
var arr = [[Int]](repeating: [Int](repeating: 0, count: input), count: input)
var currentNumber = 1

for i in 0..<input {
    for j in 0..<input {
        arr[i][j] = currentNumber
        currentNumber += 1
    }
}

// 숫자 배열 출력
for row in arr {
    print(row.map { "\($0)" }.joined(separator: " "))
}
