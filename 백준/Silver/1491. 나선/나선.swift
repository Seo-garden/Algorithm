let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
//동북서남
let dx = [1, 0, -1, 0]
let dy = [0, -1, 0, 1]

var visited = Array(repeating: Array(repeating: false, count: n), count:m)
var x = 0, y = m-1
var dir = 0

visited[y][x] = true

while true {
    let nx = x + dx[dir]
    let ny = y + dy[dir]
    
    if nx >= 0 && nx < n && ny >= 0 && ny < m && !visited[ny][nx] {
        x = nx
        y = ny
        visited[ny][nx] = true
    } else {
        dir = (dir+1) % 4
        let nx2 = x + dx[dir]
        let ny2 = y + dy[dir]
        
        if nx2 < 0 || nx2 >= n || ny2 < 0 || ny2 >= m || visited[ny2][nx2] { break }
        
        x = nx2
        y = ny2
        visited[y][x] = true
    }
}

print("\(x) \(m-1-y)")