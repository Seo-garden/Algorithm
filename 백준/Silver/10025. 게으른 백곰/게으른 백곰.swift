let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0], K = NK[1]

var input: [(Int, Int)] = []

for _ in 0..<N {
    let numbers = readLine()!.split(separator: " ").compactMap { Int($0)! }
    input.append((numbers[0], numbers[1]))
}

// 최대 인덱스 값 찾기
let maxIndex = input.map { $0.1 }.max() ?? 0

// 최대 크기만큼의 배열 초기화 (각 위치에서의 아이스크림 개수를 저장)
var iceCreamArray: [Int] = Array(repeating: 0, count: maxIndex + 1)

// 입력값에 따라 아이스크림 개수를 배열에 설정
for (iceCreamCount, position) in input {
    iceCreamArray[position] += iceCreamCount
}

// K가 maxIndex보다 클 경우, 사실상 전체 배열을 하나의 윈도우로 처리해야 합니다.
let windowRange = min(2 * K + 1, maxIndex + 1)

// 슬라이딩 윈도우를 사용하여 최대 합을 구하기
var maxSum = 0
var currentSum = 0

// 첫 번째 윈도우 계산
for i in 0..<windowRange {
    currentSum += iceCreamArray[i]
}
maxSum = currentSum

// 슬라이딩 윈도우로 최대 합 찾기
if windowRange < maxIndex + 1 {
    for i in 1...(maxIndex - windowRange + 1) {
        currentSum += iceCreamArray[i + windowRange - 1]  // 새로운 값을 더하고
        currentSum -= iceCreamArray[i - 1]                // 이전 값을 뺍니다
        maxSum = max(maxSum, currentSum)
    }
}

// 결과 출력
print(maxSum)