let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var answer = 0
var arr = Array(repeating: Array(repeating: 0, count: 10000), count: 10000)

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let lx = input[0], ly = input[1], rx = input[2], ry = input[3]
    
    for x in lx...rx {
        for y in ly...ry {
            arr[x][y] += 1
        }
    }
}

for x in 1...100 {
    for y in 1...100 {
        if arr[x][y] > m {
            answer += 1
        }
    }
}

print(answer)