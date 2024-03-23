//
//  2178.swift
//  
//
//  Created by 서정원 on 3/21/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])

var arr = [[Int]]()
for _ in 0..<N {
    arr.append(readLine()!.map{Int(String($0))!})
}
//print(arr)

var queue = [(0,0)]
let (mx, my) = ([0, 0, -1, 1], [-1, 1, 0, 0])       //상하좌우

while !queue.isEmpty {
    let (x, y) = queue.removeFirst()
    for i in 0..<4 {        //상하좌우니까 4번
        let nx = x + mx[i], ny = y + my[i]
        if nx < 0 || ny < 0 || nx >= N || ny >= M { continue }        //배열 밖으로 넘어가는 것을 방지
        if arr[nx][ny] == 0 { continue }              //0일땐 이동할 수 없음
        if arr[nx][ny] == 1 {
            arr[nx][ny] = arr[x][y] + 1
            queue.append((nx, ny))
        }
    }
}
print(arr[N - 1][M - 1])
