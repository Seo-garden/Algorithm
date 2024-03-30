//
//  1967.swift
//  
//
//  Created by 서정원 on 3/30/24.
//

//https://blog.myungwoo.kr/112
//백준 1967 DFS
import Foundation

var nCount = Int(readLine()!)!
var graph = [[(Int, Int)]](repeating: [], count: nCount + 1)
var visited = [Bool](repeating: false, count: nCount + 1)
var length = 0
for _ in 0..<nCount-1 {
    let input = readLine()!.split(separator: " ").map({ Int($0)! })
    var u = input[0], v = input[1], length = input[2]
    graph[u].append((v, length))
    graph[v].append((u, length))
}
var endnode: (node: Int, cost: Int) = (node: 0, cost: 0)
func DFS(node: Int = 1, depth: Int) {
    visited[node] = true
    if depth > endnode.cost {
        endnode = (node, depth)
    }
    
    for (nextnode, distance) in graph[node] {
        if !visited[nextnode] {
            visited[nextnode] = true
            DFS(node: nextnode, depth: depth + distance)
        }
    }
}
DFS(depth: 0)
visited = [Bool](repeating: false, count: nCount + 1)       //방문 기록 초기화
DFS(node: endnode.node, depth: 0)
print(endnode.cost)
