let T = Int(readLine()!)!
var arr = [[Int]]()
for _ in 0..<T {
    let _ = Int(readLine()!)!
    let fund = readLine()!.split(separator: " ").compactMap { Int($0)! }
    arr.append(fund)
    
    var result = 0
    var maxPrice = 0
    
    // 배열의 마지막 요소부터 시작해서 최대값을 추적
    for j in (0..<fund.count).reversed() {
        if fund[j] > maxPrice {
            maxPrice = fund[j]  // 현재 값이 maxPrice보다 크면 maxPrice 갱신
        } else {
            result += maxPrice - fund[j]  // maxPrice보다 작으면 이익을 계산
        }
    }
    
    print(result)
}