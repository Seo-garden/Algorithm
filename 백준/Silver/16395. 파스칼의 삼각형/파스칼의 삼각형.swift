let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = input[0]
let k = input[1]

var pascal = Array(repeating: [Int](), count: 30)           //2차원 배열을 이렇게 초기화하는 방법이 있구나..       [[],[],[],[],[],[],[],[],[]] 이런식으로 초기화된다.

for i in 0..<30 {
    pascal[i] = Array(repeating: 1, count: i + 1)           //가장자리는 1 로 초기화
}

for i in 2..<30 {       //이미 가장자리는 1로 채워져 있기 때문에 0이 아닌 2부터 시작
    for j in 1..<i {
        pascal[i][j] = pascal[i-1][j-1] + pascal[i-1][j]        //파스칼 삼각형의 규칙
    }
}

print(pascal[n-1][k-1])     //nCk 의 값을 구하려면 index-1