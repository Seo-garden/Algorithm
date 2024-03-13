//
//  10986.swift
//  Algorithm
//
//  Created by 서정원 on 3/13/24.
//

import Foundation

func solving() -> Int {
    let input = readLine()!.split(separator: " ").map({ Int($0)!})
    let AN = input[0], M = input[1]
    let arr = readLine()!.split(separator: " ").map({ Int($0)!})
    var cnt = 0
    var prefixSum = Array(repeating: 0 , count: AN + 1)
    
    var remainderCount = Array(repeating: 0, count: M) // 나머지가 발생한 횟수를 저장하는 배열
    
    for i in 1...AN {
        prefixSum[i] = (prefixSum[i - 1] + arr[i - 1]) % M
        if prefixSum[i] == 0 {
            cnt += 1 // 전체 배열이 M의 배수인 경우
        }
        cnt += remainderCount[prefixSum[i]] // 현재 나머지가 prefixSum[i]인 것들과 조합할 수 있는 부분 배열의 개수를 더함
        remainderCount[prefixSum[i]] += 1 // 현재 나머지 발생 횟수 증가
    }
    
    return cnt
}
print(solving())
