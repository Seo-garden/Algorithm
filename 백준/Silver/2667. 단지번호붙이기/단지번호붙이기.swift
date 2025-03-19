let n = Int(readLine()!)!
var graph = [[Int]]()

var count = 0
var home = [Int]()

for _ in 0..<n {
    let input = Array(readLine()!.map{ Int(String($0))! })
    graph.append(input)
}

private func DFS(_ x: Int, _ y: Int) {
    if x < 0 || y < 0 || x >= n || y >= n || graph[x][y] == 0 { return }
    
    count += 1
    graph[x][y] = 0     //방문 처리
    
    DFS(x, y+1)
    DFS(x, y-1)
    DFS(x+1, y)
    DFS(x-1, y)
}

for i in 0..<n {
    for j in 0..<n {
        if graph[i][j] == 1 {
            count = 0
            DFS(i, j)
            home.append(count)
        }
    }
}

print(home.count)
print(home.sorted().map({ String($0)}).joined(separator: "\n"))
