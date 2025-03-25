let t = Int(readLine()!)!

let dx = [0, 0, -1, 1]
let dy = [1, -1, 0, 0]

for _ in 0..<t {
    let mnk = readLine()!.split(separator: " ").map { Int($0)! }
    let m = mnk[0], n = mnk[1], k = mnk[2]
    var map = Array(repeating: Array(repeating: 0, count: m), count: n)
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    for _ in 0..<k {
        let input = readLine()!.split(separator: " ").map { Int($0)! }

        let x = input[0]
        let y = input[1]
        map[y][x] = 1
    }
    
    func DFS(_ x: Int, _ y: Int) {
        visited[x][y] = true
        
        for i in 0..<4 {
            let nx = dx[i] + x
            let ny = dy[i] + y
            
            if nx >= 0 && nx < n && ny >= 0 && ny < m {
                if !visited[nx][ny] && map[nx][ny] == 1 {
                    DFS(nx, ny)
                }
            }
        }
    }
    
    var answer = 0
    
    for i in 0..<n {
        for j in 0..<m {
            if !visited[i][j] && map[i][j] == 1 {
                answer += 1
                DFS(i, j)
            }
        }
    }
    
    print(answer)
}