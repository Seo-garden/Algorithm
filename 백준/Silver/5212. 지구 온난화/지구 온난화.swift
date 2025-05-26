let rc = readLine()!.split(separator: " ").map { Int($0)! }
let r = rc[0], c = rc[1]
var map = [[Character]]()
var willChange = Array(repeating: Array(repeating: false, count: c), count: r)

let dx = [0, 0, -1, 1]
let dy = [1, -1, 0, 0]


for _ in 0..<r {
    let input = Array(readLine()!)
    map.append(input)
}

for i in 0..<r {
    for j in 0..<c {
        if map[i][j] == "X" {
            var count = 0
            for k in 0..<4 {
                let nx = dx[k] + i
                let ny = dy[k] + j

                if nx >= 0 && nx < r && ny >= 0 && ny < c {
                    if map[nx][ny] == "." {
                        count += 1
                    }
                } else {
                    count += 1
                }
            }
            
            if count >= 3 {
                willChange[i][j] = true
            }
        }
    }
}

//for 문이 다 끝나면 변경사항을 반영함
for i in 0..<r {
    for j in 0..<c {
        if willChange[i][j] {
            map[i][j] = "."
        }
    }
}

var minR = r, maxR = 0, minC = c, maxC = 0

for i in 0..<r {
    for j in 0..<c {
        if map[i][j] == "X" {
            minR = min(minR, i)
            maxR = max(maxR, i)
            minC = min(minC, j)
            maxC = max(maxC, j)
        }
    }
}

for i in minR...maxR {
    for j in minC...maxC {
        print(map[i][j], terminator: "")
    }
    print()
}