let n = Int(readLine()!)!
var map = Array(repeating: Array(repeating: 0, count: n), count: n)
let k = Int(readLine()!)!


for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0] - 1 , b = input[1] - 1
    map[a][b] = 1
}

let l = Int(readLine()!)!
var timeDir = [(Int, String)]()

for _ in 0..<l {
    let xc = readLine()!.split(separator: " ").map { $0 }
    let x = Int(xc[0])!, c = String(xc[1])
    timeDir.append((x,c))
}
//오른쪽아래왼쪽위
//우하좌상
let dr = [0, 1, 0, -1]
let dc = [1, 0, -1, 0]

var time = 0
var dir = 0
var snake = [(0,0)]
var headX = 0, headY = 0
var changeIndex = 0

var occupied = Array(repeating: Array(repeating: false, count: n), count: n)
occupied[0][0] = true

//끝나는 조건, 벽에 부딪히거나, 자신의 꼬리에 부딪히거나
while true {
    time += 1
    
    let nx = headX + dr[dir]
    let ny = headY + dc[dir]
    
    if nx < 0 || ny < 0 || nx >= n || ny >= n {
        break
    }
    
    if occupied[nx][ny] {
        break
    }
    
    snake.append((nx, ny))
    occupied[nx][ny] = true
    
    if map[nx][ny] == 1 {
        map[nx][ny] = 0
    } else {
        let tail = snake.removeFirst()
        occupied[tail.0][tail.1] = false
    }
    
    headX = nx
    headY = ny
    
    if changeIndex < timeDir.count && timeDir[changeIndex].0 == time {
        let turn = timeDir[changeIndex].1
        if turn == "D" {
            dir = (dir + 1) % 4
        } else if turn == "L" {
            dir = (dir + 3) % 4
        }
        changeIndex += 1
    }
}

print(time)