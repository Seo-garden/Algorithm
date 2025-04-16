let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var baguni = [Int](repeating: 0, count: n)

for _ in 0..<m {
    let ijk = readLine()!.split(separator: " ").map { Int($0)! }
    let i = ijk[0], j = ijk[1], k = ijk[2]
    
    for u in i...j {
        if baguni[u-1] == 0 {
            baguni[u-1] = k
        } else {
            baguni[u-1] = k
        }
    }
}

print(baguni.map { String($0) }.joined(separator: " "))