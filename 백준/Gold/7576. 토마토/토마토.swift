let mn = readLine()!.split(separator: " ").map { Int($0)! }
let m = mn[0], n = mn[1]
var tomato = [[Int]]()
var count = 0

var queue = [(Int, Int)]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    tomato.append(input)
}

let dx = [0, 0, -1, 1]
let dy = [1, -1, 0, 0]

var visited = Array(repeating: Array(repeating: 0, count: m), count: n)

for y in 0..<n {
    for x in 0..<m {
        if tomato[y][x] == 1 {
            queue.append((y,x))
        }
    }
}

var index = 0

private func BFS() {
    while index < queue.count {
        let y = queue[index].0
        let x = queue[index].1
        
        index += 1
        
        for i in 0..<4 {
            let nx = dx[i] + x
            let ny = dy[i] + y
            
            if nx >= 0 && nx < m && ny >= 0 && ny < n && tomato[ny][nx] == 0 {
                tomato[ny][nx] = tomato[y][x] + 1   //
                queue.append((ny, nx))              //익은 토마토
            }
        }
    }
}

BFS()

if tomato.flatMap({ $0 }).contains(0) {
    print(-1)
} else {
    print(tomato.flatMap { $0 }.max()! - 1)
}