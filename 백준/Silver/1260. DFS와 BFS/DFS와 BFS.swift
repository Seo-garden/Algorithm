import Foundation

struct Queue<T> {
    private var queue: [T] = []
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], M = input[1], V = input[2]
var graph = [[Int]](repeating: [], count: N+1)
var visited = [Bool](repeating: false, count: N+1)
var queue = Queue<Int>()
var result = ""

for _ in 1...M {
    let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
    let a = inputArr[0], b = inputArr[1]
    graph[a].append(b)
    graph[b].append(a)
}

for i in 1...N {
    graph[i].sort()
}

private func DFS(_ node: Int) {
    visited[node] = true
    result += "\(node) "
    for nextnode in graph[node] {
        if !visited[nextnode] {
            DFS(nextnode)
        }
    }
}

private func BFS(_ node: Int) {
    visited[node] = true
    
    queue.enqueue(node)
    while !queue.isEmpty {
        let q = queue.dequeue()!
        print(q, terminator: " ")
        for nextnode in graph[q] {
            if !visited[nextnode] {
                visited[nextnode] = true
                queue.enqueue(nextnode)
            }
        }
    }
}

DFS(V)
print(result)
visited = [Bool](repeating: false, count: N+1)
BFS(V)