//k 는 담을 배열의 요소 개수
import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var dict = [Int: Int]()
    var size = Set(tangerine).sorted()
    
    var result = 0
    var num = k
    
    for i in tangerine {
        if dict[i] == nil {
            dict[i] = 1
        } else {
            dict[i]! += 1
        }
    }
    
    var sortedDict = dict.sorted { $0.value > $1.value}
    for i in sortedDict {
        result += 1
        num -= i.value
        if num <= 0 { break }
    }
    return result
}
