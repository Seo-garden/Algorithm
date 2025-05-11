let n = Int(readLine()!)!
var map = [[Character]]()
var result = Array(repeating: Array(repeating: 0, count: n), count: n)

let dx = [-1, 0, 1, 1, 1, 0, -1, -1]
let dy = [1, 1, 1, 0, -1, -1, -1, 0]

for _ in 0..<n {
    let input = Array(readLine()!)
    map.append(input)
}

for x in 0..<n {
    for y in 0..<n {
        if map[x][y] != "." {       //숫자가 존재
            let power = Int(String(map[x][y]))!
            
            for k in 0..<8 {                //8방향 탐색
                let nx = dx[k] + x
                let ny = dy[k] + y
                
                if nx >= 0 && nx < n && ny >= 0 && ny < n {     //맵 밖으로 탐색하지 않기 위함
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
        } else {
            line = "*"
        }
    }
    print(line)
}
