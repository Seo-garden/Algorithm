let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

var bag = [Int]()

for i in 1...n {
    bag.append(i)
}

for _ in 1...m {
    let ij = readLine()!.split(separator: " ").map { Int(String($0))! }
    let i = ij[0], j = ij[1]
    
    bag.swapAt(i-1, j-1)
}

print(bag.map { String($0)}.joined(separator: " "))