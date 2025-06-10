var n = Int(readLine()!)!
var working = [(Int, Int)]()

var index = -1
var result = 0

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    if input[0] == 1 {
        working.append((input[1],input[2]-1))
        index += 1
        
        if working[index].1 == 0 {
            result += working[index].0
            working.removeLast()
            index -= 1
        }
    } else {
        if index >= 0 {
            working[index].1 -= 1
            if working[index].1 == 0 {
                result += working[index].0
                working.removeLast()
                index -= 1
            }
        }
    }
}

print(result)