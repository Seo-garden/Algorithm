//
//  11724.swift
//  Algorithm
//
//  Created by 서정원 on 3/8/24.
//
//
import Foundation
//방향 없는 그래프가 주어졌을 때, 연결 요소 (Connected Component)의 개수를 구하는 프로그램을 작성하시오. 11724 문제
//연결 요소 : DFS
//입력 : 첫째 줄에 정점의 개수 N과 간선의 개수 M이 주어진다. (1 ≤ N ≤ 1,000, 0 ≤ M ≤ N×(N-1)/2) 둘째 줄부터 M개의 줄에 간선의 양 끝점 u와 v가 주어진다. (1 ≤ u, v ≤ N, u ≠ v) 같은 간선은 한 번만 주어진다.
//출력 : 첫째 줄에 연결 요소의 개수를 출력한다.
//예제 입력 정점의 개수 and 간선의 개수
//6 5

//1 2
//2 5
//5 1
//3 4
//4 6
//1번 사안
let input = readLine()!.split(separator: " ").map({ Int($0)! })     // 6 3
let N = input[0], M = input[1]      //숫자범위, 선언할 숫자

var graph = [[Int]](repeating: [], count: N+1)
for _ in 0..<M {
    let arr = readLine()!.split(separator: " ").map({ Int($0)! })
    let u = arr[0], v = arr[1]
    graph[u].append(v)        //양방향이기 때문에, 그래서 단방향의 경우 아래껀 하지 않는다.
    graph[v].append(u)
}
//print(graph)      이게 내가 종이쪼가리에 작성했던 인접리스트처럼 된다.
var visitedArr = [Bool](repeating: false, count: N+1)
func DFS(node : Int) {
    visitedArr[node] = true        //현재 정점을 방문했다
    //방문하지 않는 노드
    for nextNode in graph[node] {
        if !visitedArr[nextNode] {              //아직 정점을 방문하지 않았다면
            visitedArr[nextNode] = true
            DFS(node: nextNode)
        }
    }
}
var count = 0
for i in 1...N {
    if !visitedArr[i] {
        count += 1
        DFS(node: i)
    }
}
print(count)
//얘는 왜 런타임 에런지 모르겠다.
//var count = 0 // DFS 횟수
//let input = readLine()!.split(separator: " ").map({ Int($0)! })     // 6 3
//let N = input[0], M = input[1]      //숫자범위, 선언할 숫자
//var visitedArr = [Bool](repeating: false, count: N+1)
//var depth = 0
//var graph = [[Int]](repeating: [], count: N+1)
//for _ in 1...M {
//    var arr = readLine()!.split(separator: " ").map({ Int(String($0))! })
//    let u = arr[0], v = arr[1]
//    graph[u].append(v)        //양방향이기 때문에, 그래서 단방향의 경우 아래껀 하지 않는다.
//    graph[v].append(u)
//}
////print(graph)      이게 내가 종이쪼가리에 작성했던 인접리스트처럼 된다.
//func DFS(_ start : Int, _ depth : Int) {
//    visitedArr[start] = true        //현재 정점을 방문했다
//    for i in 0..<graph[start].count {       //현재 정점에 연결된 모든 정점에 대한 반복
//        let next = graph[start][i]          //다음번에 방문할 정점을 선택
//        if !visitedArr[next] {              //아직 정점을 방문하지 않았다면
//            DFS(next, depth+1)              //1증가 후 재귀함수 호출
//        }
//    }
//}
//for i in 1...N {
//    if !visitedArr[i] {
//        count += 1
//        DFS(i, depth)
//    }
//}
//print(count)
