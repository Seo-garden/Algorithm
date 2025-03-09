let nmv = readLine()!.split(separator: " ").map { Int($0)! }
let n = nmv[0], m = nmv[1], v = nmv[2]

var graph = [[Int]](repeating: [], count: n+1)
var visited = [Bool](repeating: false, count: n+1)

var result = ""

for _ in 1...m {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let x = input[0], y = input[1]
    
    graph[x].append(y)
    graph[y].append(x)
}

for i in 1...n {
    graph[i].sort()
}



private func DFS(_ start: Int) {
    visited[start] = true
    result += "\(start) "
    
    for nextnode in graph[start] {
        if !visited[nextnode] {
            DFS(nextnode)
        }
    }
}


private func BFS(_ start: Int) {
    var queue = [start]
    visited[start] = true

    while !queue.isEmpty {
        let node = queue.removeFirst()
        result += "\(node) "
        for nextnode in graph[node] {
            if !visited[nextnode] {
                queue.append(nextnode)
                visited[nextnode] = true
            }
        }
    }
}

DFS(v)
print(result)
result = ""
visited = [Bool](repeating: false, count: n+1)
BFS(v)
print(result)