let N = Int(readLine()!)!
let distance = readLine()!.split(separator: " ").compactMap { Int($0)! }
let price = readLine()!.split(separator: " ").compactMap { Int($0)! }
var min = price[0]
var result = 0

for i in 0..<N-1 {
    //각 도시마다, 현재 도시에서의 기름값이 min보다 작으면 min을 업데이트합니다. 즉, 더 저렴한 가격을 발견하면 그 이후로는 그 가격을 사용합니다.
    if price[i] < min {
        min = price[i]
    }
    result += min * distance[i]
}

print(result)