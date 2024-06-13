//
//  10986.swift
//  Algorithm
//
//  Created by 서정원 on 3/13/24.
//

import Foundation
//수 N개 A1, A2, ..., AN이 주어진다. 이때, 연속된 부분 구간의 합이 M으로 나누어 떨어지는 구간의 개수를 구하는 프로그램을 작성하시오.
//즉, Ai + ... + Aj (i ≤ j) 의 합이 M으로 나누어 떨어지는 (i, j) 쌍의 개수를 구해야 한다.
//(A+B) % C == ((A%C) + (B%C)) % C
//S[j] - S[i - 1] = Ai + ... Aj
//[1,2,3,4,5]
//[1,3,6,10,15]
//S[4] - S[2] = 15 - 6
//A[3] + A[4] = 9
//S[i] - S[j] = A[j+1] ... A[i] 까지의 구간합이다. ⭐️
//A [3,2,4,5,1]
//S [3,5,9,14,15]
//S%M [0,2,0,2,0]
//S[3] - S[1] == A[2] + ... A[3]


//5 3
//1 2 3 1 2
//prefixSum[] = 1 3 6 7 9
//출력 : 7

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
//(S[j] − S[i−1]) % M =0
//(S[j] % M) − (S[i−1] % M) =0
// S[j] % M= S[i−1] % M
