//
//  1189.swift
//  Algorithm
//
//  Created by 서정원 on 3/23/24.
//

//백준 1189
//3 4 6
//....
//.T..
//....
import Foundation

// 표준 입력을 통해 값 입력받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let R = input[0]
let C = input[1]
let K = input[2]

var graph = [[Character]]()
for _ in 0..<R {
    let row = Array(readLine()!)
    graph.append(row)
}

let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]

var answer = 0

func DFS(_ x: Int, _ y: Int, _ distance: Int) {
    // 목표 도착 지점 : (0,C-1), 목표 거리 : K
    if distance == K && y == C - 1 && x == 0 {      //x 는 출발지점
        answer += 1
    } else {
        // T로 방문처리, 어차피 T 로 된곳은 못가니까
        graph[x][y] = "T"
        for i in 0..<4 {
            let nx = x + dx[i]  //다음좌표
            let ny = y + dy[i]
            if nx >= 0 && nx < R && ny >= 0 && ny < C && graph[nx][ny] == "." {     //방문하지 않았는지 확인
                graph[nx][ny] = "T"     //방문하면 T
                DFS(nx, ny, distance + 1)
                // 원래 상태로 돌려 놓아 다른 방향으로 다시 탐색하도록 한다.
                graph[nx][ny] = "."     //이게 백트래킹 한정 조건이란다.
            }
        }
    }
}

DFS(R-1, 0, 1)
print(answer)
