import Foundation

let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let sum = Int(readLine()!)!

var left = 0
var right = a.count - 1
var count = 0

while left < right {
    if a[left] + a[right] == sum {
        count += 1
        left += 1
        right -= 1
    } else if a[left] + a[right] < sum {
        left += 1
    } else if a[left] + a[right] > sum {
        right -= 1
    }
}

print(count)