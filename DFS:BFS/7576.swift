//
//  7576.swift
//  
//
//  Created by 서정원 on 3/29/24.
//

//백준 7576
import Foundation

//상하좌우 방향으로 익은 토마토가 있다면 상하좌우 토마토도 익는다. (하루가 지나면)
//모두가 익지 못하면 일수 말고 -1 이 출력되야 한다.
//저장할 때 부터 토마토가 모두 익어있으면 1 을 출력
//상자엔 무조건 토마토가 1개는 있어야 된다.

var input = readLine()!.split(separator: " ").map({ Int($0)! })

var m = input[0], n = input[1]

var graph = [[Int]]()
var queue = [(Int,Int)]()       //0,0 으로 초기화해서 안되는거였다.
var dx = [0, 0, -1, 1]
var dy = [1, -1, 0, 0]
var sec = 0
var empty = 0       //비워진

for _ in 0..<n {
    let box = readLine()!.split(separator: " ").map({ Int($0)! })
    graph.append(box)
}

func bfs() {
    var index = 0
    while index < queue.count {
        let (x, y) = queue[index]
        index += 1
        
        for i in 0..<4 {        //상, 하, 좌, 우 4가지의 경우
            let nx = dx[i] + x
            let ny = dy[i] + y
            if nx < 0 || ny < 0 || nx >= n || ny >= m { continue }
            
            if graph[nx][ny] == 0 {
                queue.append((nx, ny))
                graph[nx][ny] = graph[x][y] + 1
                sec += 1
            }
        }
    }
}
// 메인 코드 실행 전, 박스에 있는 익은 토마토 및 안익은 토마토 체크
for x in 0..<n {
    for y in 0..<m {
        if graph[x][y] == 1 { queue.append((x, y)) } // 1이면 큐에 추가
        else if graph[x][y] == 0 { empty += 1 } // 0이면 empty에 개수 누적
    }
}

bfs()

empty == 0 ? print(0) : (empty == sec ? print(graph.flatMap({$0}).max()!-1) : print(-1))




//https://seolhee2750.tistory.com/126
