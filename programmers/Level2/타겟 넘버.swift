import Foundation
//전형적인 DFS 문제다

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var count = 0
    
    func DFS(_ index: Int, _ sum: Int) {
        if index == numbers.count {
            if sum == target { count += 1}
            return
        }
        DFS(index + 1, sum + numbers[index])
        DFS(index + 1, sum - numbers[index])
    }
    DFS(0, 0)
    return count
}
