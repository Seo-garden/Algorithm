import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    let K = Int(readLine()!)!
    let lst = [0] + readLine()!.split(separator: " ").map { Int($0)! }

    var s_lst = [Int](repeating: 0, count: K + 1)
    for i in 1...K {
        s_lst[i] = s_lst[i - 1] + lst[i]
    }

    var dp = [[Int]](repeating: [Int](repeating: 0, count: K + 1), count: K + 1)

    for i in 2...K {
        for j in 1...(K + 1 - i) {
            var minValue = Int.max
            for q in 0..<i - 1 {
                let cost = dp[j][j + q] + dp[j + q + 1][j + i - 1]
                if cost < minValue {
                    minValue = cost
                }
            }
            dp[j][j + i - 1] = minValue + (s_lst[j + i - 1] - s_lst[j - 1])
        }
    }

    print(dp[1][K])
}