let nm = readLine()!.split(separator: " ").map { Int($0)! }
var map = [[Int]]()
let n = nm[0], m = nm[1]
let rcd = readLine()!.split(separator: " ").map { Int($0)! }
var r = rcd[0], c = rcd[1], d = rcd[2]

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(input)
}

var count = 0

// 북동남서
let dr = [-1, 0, 1, 0]
let dc = [0, 1, 0, -1]

//1. 현재 칸이 아직 청소되지 않은 경우, 현재 칸을 청소한다.
//2. 현재 칸의 주변 4칸 중 청소되지 않은 빈 칸이 없는 경우,
//2-1. 바라보는 방향을 유지한 채로 한 칸 후진할 수 있다면 한 칸 후진하고 1번으로 돌아간다.
//2-2. 바라보는 방향의 뒤쪽 칸이 벽이라 후진할 수 없다면 작동을 멈춘다.
//3. 현재 칸의 주변 4칸 중 청소되지 않은 빈 칸이 있는 경우,
//3-1. 반시계 방향으로 90도 회전한다.
//3-2. 바라보는 방향을 기준으로 앞쪽 칸이 청소되지 않은 빈 칸인 경우 한 칸 전진하고 1번으로 돌아간다.
while true {
    //1번
    if map[r][c] == 0 {
        map[r][c] = 2
        count += 1
    }
    
    var found = false
    
    for _ in 0..<4 {
        d = (d + 3) % 4
        let nr = r + dr[d]
        let nc = c + dc[d]
        
        if map[nr][nc] == 0 {
            r = nr
            c = nc
            found = true
            break
        }
    }
    
    if !found {
        let back = (d + 2) % 4
        let br = r + dr[back]
        let bc = c + dc[back]
        
        if map[br][bc] == 1 {
            break
        } else {
            r = br
            c = bc
        }
    }
}

print(count)