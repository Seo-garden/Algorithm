let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

var map = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

for _ in 0..<n {
    let row = Array(readLine()!).map { Int(String($0))! }
    map.append(row)
}

func BFS(_ x: Int, _ y: Int) {
    var queue: [[Int]] = [[x, y]]
    visited[x][y] = true

    while !queue.isEmpty {
        let current = queue.removeFirst()
        let cx = current[0]
        let cy = current[1]

        for i in 0..<4 {
            let nx = cx + dx[i]
            let ny = cy + dy[i]

            if nx >= 0 && nx < n && ny >= 0 && ny < m {
                if map[nx][ny] == 1 && !visited[nx][ny] {
                    visited[nx][ny] = true
                    map[nx][ny] = map[cx][cy] + 1
                    queue.append([nx, ny])
                }
            }
        }
    }
}

BFS(0, 0)
print(map[n-1][m-1])
