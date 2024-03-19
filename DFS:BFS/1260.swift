//
//  1260.swift
//  
//
//  Created by 서정원 on 3/18/24.
//

import Foundation

struct Queue<T>{
    var queue : [Int] = []
    mutating func enque(_ x: Int){
        queue.append(x)
    }
    
    mutating func deque() -> Int{
        if !queue.isEmpty{
            queue.reverse()
            let a = queue.removeLast()
            queue.reverse()
            return a
        } else {
            return 0
        }
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
}

let input = readLine()!.split(separator: " ").map({ Int($0)! })
var N = input[0], M = input[1], S = input[2]
var graph = [[Int]](repeating: [], count: N+1)
var visited = [Bool](repeating: false, count: N+1)
var result = ""
var queue = Queue<Int>() //아래 선언한 Queue구조체를 가져왔다.

for _ in 1...M {
    let inputArr = readLine()!.split(separator: " ").map({ Int($0)! })
    var a = inputArr[0], b = inputArr[1]
    graph[a].append(b)
    graph[b].append(a)
}

for i in 1...N {
    graph[i].sort()
}

func DFS(node: Int) {
    visited[node] = true
    result += "\(node) "
    for nextnode in graph[node] {
        if !visited[nextnode] {
            DFS(node: nextnode)
        }
    }
}

func BFS(node: Int) {
    visited[node] = true        //현재 노드를 방문했다.
    queue.enque(node)           //큐에 현재 노드를 넣는다.
    while !queue.isEmpty() {    //큐가 비어있지 않을 동안
        let now = queue.deque()     //큐에서 현재 노드를 꺼내고
        print(now, terminator: " ") //현재 노드를 출력
        for nextnode in graph[now] {    //미방문 노드를 반복
            if !visited[nextnode] {     //다음 노드가 방문하지 않았다면
                visited[nextnode] = true
                queue.enque(nextnode)
            }
        }
    }
}

DFS(node: S)
print(result)
visited = [Bool](repeating: false, count: N+1)
BFS(node: S)
