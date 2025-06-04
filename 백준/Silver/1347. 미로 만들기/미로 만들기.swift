_ = Int(readLine()!)!
let input = readLine()!

//동서북남 0,1,2,3
let dx = [0, 0, -1, 1]
let dy = [1, -1, 0, 0]
var direction = 3

var x = 50, y = 50

var visited = Array(repeating: Array(repeating: false, count: 101), count: 101)
visited[x][y] = true

var path = [(x: Int, y: Int)]()
path.append((x,y))

for cmd in input {
    switch cmd {
    case "L":
        if direction == 0 { direction = 2 }
        else if direction == 1 { direction = 3 }
        else if direction == 2 { direction = 1 }
        else if direction == 3 { direction = 0 }
    case "R":
        if direction == 0 { direction = 3 }
        else if direction == 1 { direction = 2 }
        else if direction == 2 { direction = 0 }
        else if direction == 3 { direction = 1 }
    case "F":
        x += dx[direction]
        y += dy[direction]
        visited[x][y] = true
        path.append((x,y))
    default:
        break
    }
}

let minX = path.map { $0.x }.min()!
let minY = path.map { $0.y }.min()!
let maxX = path.map { $0.x }.max()!
let maxY = path.map { $0.y }.max()!

for i in minX...maxX {
    var row = ""
    for j in minY...maxY {
        row += visited[i][j] ? "." : "#"
    }
    print(row)
}