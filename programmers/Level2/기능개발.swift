import Foundation
//ceil() 함수는 값을 올림
func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var criteria: Int = 0
    var ans: [Int] = []
    for i in 0..<progresses.count {
        let day = Int(ceil((100 - Double(progresses[i])) / Double(speeds[i])))
        if day > criteria {
            criteria = day
            ans.append(1)
        } else {
            ans[ans.count-1] += 1
        }
    }
    return ans
}
