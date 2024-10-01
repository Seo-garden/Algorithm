let nx = readLine()!.split(separator: " ").map { Int($0)! }
let (n, x) = (nx[0], nx[1])
let visit = readLine()!.split(separator: " ").map { Int($0)! }
var (left, right, sum, max, ans) = (0, x - 1, 0, 0, 1)

for i in 0..<n - x + 1 {
    if i == 0 { // 처음 값
        for j in 0..<x {
            sum += visit[j]
        }
        max = sum
    }
    
    else {  // 처음 이후
        sum = sum - visit[i - 1] + visit[i + x - 1] // 첫 번째 값 빼주고, 마지막 값 더하기
        if sum == max {
            ans += 1
        } else if sum > max {
            max = sum
            ans = 1
        }
    }
}

if max == 0 {
    print("SAD")
} else {
    print(max)
    print(ans)
}