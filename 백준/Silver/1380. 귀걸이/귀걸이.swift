var scene = 1

while true {
    let n = Int(readLine()!)!
    if n == 0 { break }
    var students = [String]()
    var earings = [Int]()
    
    for _ in 0..<n {
        let input = readLine()!
        students.append(input)
        earings.append(0)
    }
    
    for _ in 0..<2*n-1 {
        let num = Int(readLine()!.split(separator: " ")[0])! - 1
        earings[num] += 1
    }
    
    print("\(scene) \(students[earings.firstIndex(of: 1)!])")

    scene += 1
}
