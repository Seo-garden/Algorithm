let n = Int(String(readLine()!))!
var arr = Array(repeating: Array(repeating: 0, count: n), count: n)
var visited = Array(repeating: false, count: n)
var result: [Int] = []
var resultMin = Int.max
var team1 = 0
var team2 = 0
for i in 0..<n {
    let a = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[i] = a
}

func dfs(_ depth: Int,_ start: Int) {
    if depth == n/2 {
        team1 = 0
        team2 = 0
        for i in 0..<n{
            for j in 0..<n{
                if !visited[i] && !visited[j]{
                    team2 += arr[i][j]
                }
                if visited[i] && visited[j] {
                    team1 += arr[i][j]
                }
                
            }
            
        }
        resultMin = min(resultMin, abs(team1 - team2))
        return
    }
    for i in start..<n {
        if !visited[i] {
            visited[i] = true
            dfs(depth + 1, i)
            visited[i] = false
        }
    }
}
dfs(0, 0)
print(resultMin)