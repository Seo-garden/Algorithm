let N = Int(readLine()!)!
let M = Int(readLine()!)!
let inputArr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var left = 0
var right = inputArr.count - 1
var count = 0

while left < right {
    if inputArr[left] + inputArr[right] == M {
        count += 1
        left += 1
        right -= 1
        
        continue
    }
    
    if inputArr[left] + inputArr[right] < M {
        left += 1
    } else { right -= 1 }
}

print(count)