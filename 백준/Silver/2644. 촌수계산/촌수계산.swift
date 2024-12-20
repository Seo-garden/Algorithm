let N = Int(readLine()!)!
let number = readLine()!.split(separator: " ").map { Int($0)! }
let start = number[0], end = number[1]
let M = Int(readLine()!)!
var graph = [[Int]](repeating: [], count: N+1)
var visited = [Bool](repeating: false, count: N+1)
var answer = -1

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let a = input[0], b = input[1]
    graph[a].append(b)
    graph[b].append(a)
}

private func DFS(_ node: Int, _ depth: Int) {
    visited[node] = true
    
    if node == end {
        answer = depth
        return
    }
    
    for nextnode in graph[node] {
        if !visited[nextnode] {
            visited[nextnode] = true
            DFS(nextnode, depth + 1)
        }
    }
}
DFS(start, 0)
print(answer)