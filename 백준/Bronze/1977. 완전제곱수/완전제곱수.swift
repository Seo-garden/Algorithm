import Foundation

let m = Int(readLine()!)!
let n = Int(readLine()!)!
var arr = [Int]()

let start = Int(ceil(sqrt(Double(m))))
let end = Int(floor(sqrt(Double(n))))

var sum = 0

if start > end {
    print(-1)
} else {
    for n in start...end {
        sum += n * n
    }
    print(sum)
    print(start*start)
}