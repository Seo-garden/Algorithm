let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n, m) = (nm[0], nm[1])

var arr = [[Int]]()
for _ in 0..<n {
    arr.append(readLine()!.map{Int(String($0))!})
}
var queue = [(0, 0)]
let (dx, dy) = ([-1, 1, 0, 0], [0,0,1,-1])

while !queue.isEmpty {
    let (x, y) = queue.removeFirst()
    for i in 0..<4 {
        let nx = x + dx[i], ny = y + dy[i]
        if nx < 0 || ny < 0 || nx >= n || ny >= m {continue}
        if arr[nx][ny] == 0 {continue}
        if arr[nx][ny] == 1 {
            arr[nx][ny] = arr[x][y] + 1
            queue.append((nx, ny))
            }
            
        }
}
print(arr[n - 1][m - 1])
