//5월 29일 수요일 오후 2시 10분 시작
import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var sum = 0
    var absolutes = absolutes
    for i in 0..<absolutes.count {
        if signs[i] == true {
            absolutes[i] = +(absolutes[i])
        } else {
            absolutes[i] = -(absolutes[i])
        }
        
        sum += absolutes[i]
    }
    return sum
}
