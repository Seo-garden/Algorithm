let mn = readLine()!.split(separator: " ").map { Int($0)! }
let m = mn[0], n = mn[1]
var map = [[Int]]()

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]


for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var queue: [(Int, Int)] = []

for y in 0..<n {
    for x in 0..<m {
        if map[y][x] == 1 {      //익은 토마토
            queue.append((y,x))
        }
    }
}


var index = 0

while index < queue.count {
    let y = queue[index].0
    let x = queue[index].1
    
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        // 범위 내에 있으면서, 방문하지 않고, 익지 않은 토마토일 경우
        if 0..<m ~= nx && 0..<n ~= ny && map[ny][nx] == 0 {
            map[ny][nx] = map[y][x] + 1
            queue.append((ny, nx))
        }
    }
    index += 1
}

print(map.flatMap { $0 }.contains(0) ? -1 : map.flatMap { $0 }.max()! - 1)