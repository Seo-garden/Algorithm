//5월 28일 화요일 오후 2시 40분 시작
import Foundation

func solution(_ elements:[Int]) -> Int {
    var sumSet = Set<Int>()
    for i in 0..<elements.count {
        var sum = 0
        for j in 0..<elements.count {
            var idx = i + j
            if idx >= elements.count {
                idx = idx - elements.count
            }
            sum += elements[idx]
            sumSet.insert(sum)
        }
    }
    return sumSet.count
}
