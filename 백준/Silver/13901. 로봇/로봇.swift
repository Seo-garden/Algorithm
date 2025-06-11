let rc = readLine()!.split(separator: " ").map { Int($0)! }
let r = rc[0], c = rc[1]

var map = Array(repeating: Array(repeating: false, count: c), count: r)

let k = Int(readLine()!)!
for _ in 0..<k {
    let pos = readLine()!.split(separator: " ").map { Int($0)! }
    map[pos[0]][pos[1]] = true // 장애물
}

let start = readLine()!.split(separator: " ").map { Int($0)! }
var sr = start[0], sc = start[1]
map[sr][sc] = true // 시작 위치 방문 처리

let inputDir = readLine()!.split(separator: " ").map { Int($0)! - 1 } // 방향 인덱스

let dr = [-1, 1, 0, 0] // 상, 하, 좌, 우
let dc = [0, 0, -1, 1]

var dirIndex = 0
var moved = true

while moved {
    moved = false
    for i in 0..<4 {
        let dir = (dirIndex + i) % 4
        let nr = sr + dr[inputDir[dir]]
        let nc = sc + dc[inputDir[dir]]
        
        // 배열 범위 내, 미방문, 장애물 아님
        if nr >= 0 && nr < r && nc >= 0 && nc < c && !map[nr][nc] {
            sr = nr
            sc = nc
            dirIndex = dir
            map[sr][sc] = true
            moved = true
            break
        }
    }
}

print(sr, sc)