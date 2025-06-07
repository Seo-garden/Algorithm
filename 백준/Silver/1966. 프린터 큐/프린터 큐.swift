let t = Int(readLine()!)!

for _ in 0..<t {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]
    var queue = [(Int, Int)]()
    
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    for i in 0..<n {
        queue.append((input[i], i))
    }
    
    var result = 0
    
    while !queue.isEmpty {
        let current = queue.first!
        
        if queue.contains { $0.0 > current.0 } {
            queue.removeFirst()
            queue.append(current)
        } else {
            queue.removeFirst()
            result += 1
            if current.1 == m {
                break
            }
        }
    }
    print(result)
}