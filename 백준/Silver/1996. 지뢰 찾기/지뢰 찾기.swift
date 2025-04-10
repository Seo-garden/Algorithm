let n = Int(readLine()!)!
var map = [[Character]]()

var temp = 0

let dx = [0, 0, -1, 1, 1, -1, 1, -1]
let dy = [1, -1, 0, 0, 1, -1, -1, 1]

var result = Array(repeating: Array(repeating: 0, count: n), count: n)

for _ in 0..<n {
    let input = Array(readLine()!)
    map.append(input)
}

var count = 0



for i in 0..<n {
    for j in 0..<n {
        if map[i][j] != "." {
            let power = Int(String(map[i][j]))!
            
            for k in 0..<8 {
                let nx = dx[k] + i
                let ny = dy[k] + j
                
                if nx >= 0 && nx < n && ny >= 0 && ny < n {
                    if map[nx][ny] == "." {
                        result[nx][ny] += power
                    }
                }
            }
        }
    }
}

for i in 0..<n {
    var line = ""
    
    for j in 0..<n {
        if map[i][j] == "." {
            line += result[i][j] >= 10 ? "M" : String(result[i][j])
        } else if map[i][j] != "." {
            line += "*"
        } else { line = "*" }
    }
    print(line)
}