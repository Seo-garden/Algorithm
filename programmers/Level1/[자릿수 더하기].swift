import Foundation

func solution(_ n:Int) -> Int {
    var answer:Int = 0
    
    if n > 100000000 { return 0 }
    
    var arr = String(n).map {Int(String($0))!}
    
    for i in 0..<arr.count {
        answer += arr[i]
    }
    
    return answer
}
