import Foundation

func solution(_ s:String) -> [Int] {
    var s = s
    var binaryCount = 0
    var zeroCount = 0
    
    while s != "1" {
        let xLength = s.filter { $0 != "0"}.count
        let zero = s.count - xLength
        
        s = String(xLength, radix: 2)
        binaryCount += 1
        zeroCount += zero
    }
    return [binaryCount, zeroCount]
}
