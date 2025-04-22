let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var arr = [Int](1...n)

for _ in 0..<m {
    let ij = readLine()!.split(separator: " ").map { Int($0)! }
    var i = ij[0] - 1 , j = ij[1] - 1
    
    while i < j {
        arr.swapAt(i, j)
        i += 1
        j -= 1
    }
}

print(arr.map { String($0)}.joined(separator: " "))