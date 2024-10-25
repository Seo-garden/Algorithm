//if 입력받은 B를 바탕으로 모든 층을 채울 수 있다면, 채우고 else
//else 원래 층을 이루고 있던 블럭도 옮길 수 있다. -> 모든 2차원 배열의 합에서 나눈 층으로 블록을 채우던지 빼던지
import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M, B) = (input[0], input[1], input[2])

var ground = [Int]()
for _ in 0..<N {
    ground += readLine()!.split(separator: " ").map { Int($0)! }
}

var time = Array(repeating: 0, count: 257)
var height = 0

for g in 0..<257 {
    var block = B
    var currentTime = 0
    
    for i in ground {
        if i <= g {
            currentTime += g - i
            block -= g - i
        } else {
            currentTime += 2 * (i - g)
            block += i - g
        }
    }
    
    if block >= 0 && (time[height] == 0 || currentTime <= time[height]) {
        time[g] = currentTime
        height = g
    }
}

print(time[height], height)