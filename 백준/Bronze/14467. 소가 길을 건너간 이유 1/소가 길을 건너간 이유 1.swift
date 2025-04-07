let n = Int(readLine()!)!
var cowLocation = [Int:Int]()
var result = 0

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let key = input[0], location = input[1]
    
    if cowLocation.keys.contains(key) {
        if cowLocation[key] != location {
            cowLocation[key] = location
            result += 1
        }
    } else {
        cowLocation[key] = location
    }
}

print(result)