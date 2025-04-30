let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n+1)

for now in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let t = input[0], p = input[1]
    
    dp[now+1] = max(dp[now+1], dp[now])
    
    if now + t < n + 1 {
        dp[now + t] = max(dp[now+t], dp[now]+p)
    }
}

print(dp.max()!)