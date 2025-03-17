let n = Int(readLine()!)!
let number = readLine()!.split(separator: " ").map { Int($0)! }

var graph = [[Int]](repeating: [], count: n+1)
var visited = [Bool](repeating: false, count: n+1)

var result: Int = -1

let start = number[0], end = number[1]
let m = Int(readLine()!)!

for _ in 1...m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let x = input[0], y = input[1]
    graph[x].append(y)
    graph[y].append(x)
}



private func DFS(_ start: Int, _ depth: Int) {
    visited[start] = true
    
    if start == end {
        result = depth
    }
    
    for nextnode in graph[start] {
        if !visited[nextnode] {
            DFS(nextnode, depth+1)
        }
    }
}

DFS(start, 0)
print(result)