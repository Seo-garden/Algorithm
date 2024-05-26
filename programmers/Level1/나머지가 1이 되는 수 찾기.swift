import Foundation

func solution(_ n:Int) -> Int {
    var result = 0
    for i in 2... {
        if n % i == 1 && n <= 1000000 {
            result = i
            break
        }
    }
    return result
}
