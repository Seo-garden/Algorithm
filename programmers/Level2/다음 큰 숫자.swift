import Foundation
//예를 들어 78(01001110) 이 입력되면 2진수로 변환하고 String(value, radix: 2)
//1의 갯수를 파악해서 78보다 큰 수를 return

func solution(_ n:Int) -> Int
{
    var binary = String(n, radix: 2)
    let count = binary.filter{ $0 == "1"}.count
    var n = n + 1
    
    while true {
        binary = String(n, radix: 2)
        if binary.filter({ $0 == "1"}).count == count { break }
        n = n + 1
    }
    
    return n
    
}
