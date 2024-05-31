import Foundation
//arr1 에 있는 index 를 다 더한 다음에
//그 수를 arr2 에 곱해서 return
func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
     var answer = Array(repeating: Array(repeating: 0, count: arr2[0].count), count: arr1.count)

    for i in 0..<answer.count {
        for j in 0..<answer[i].count {
            for k in 0..<arr1[0].count {
                answer[i][j] += arr1[i][k] * arr2[k][j]
            }
        }
    }
    return answer
}
print(solution([[2, 3, 2], [4, 2, 4], [3, 1, 4]], [[5, 4, 3], [2, 4, 1], [3, 1, 1]]))
