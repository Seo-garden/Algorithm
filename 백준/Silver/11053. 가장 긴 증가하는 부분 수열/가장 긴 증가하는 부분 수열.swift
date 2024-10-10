let input = Int(readLine()!)!
var arr = [Int]()
var dp = [Int](repeating: 1, count: input + 1)
let A = readLine()!.split(separator: " ").compactMap{ Int($0)! }

for i in 1..<A.count {
    for j in 0..<i {
        if A[j] < A[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}
print(dp.max()!)