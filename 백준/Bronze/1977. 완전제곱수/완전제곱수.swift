let m = Int(readLine()!)!
let n = Int(readLine()!)!

var sum = 0
var arr = [Int]()

for i in 1...n {
    for j in m...n {
        if j == i * i {
            sum += j
            arr.append(j)
        }
    }
}

if sum == 0 {
    print(-1)
} else {
    print(sum)
    print(arr.min()!)
}