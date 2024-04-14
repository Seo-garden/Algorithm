//백준 15663 오후 3시 30분 시작 - 4시 9분 제출
//4 2
//9 7 9 1
//4개의 숫자중 2개를 골라 나오는 수열의 전체를 출력해야 함

var NM = readLine()!.split(separator: " ").map({ Int(String($0))! })
var N = NM[0], M = NM[1]
var number = readLine()!.split(separator: " ").map({ Int(String($0))! }).sorted()

var result = [String]()     //탐색결과
var visited = [Bool](repeating: false, count: N+1)
var checked = Set<String>()     //중복체크

func dfs(_ depth: Int) {
    if depth == M {
        let resultString = result.joined(separator: " ")        //중복 체크하고 중복되지 않으면 출력
        if !checked.contains(resultString) {
            checked.insert(resultString)
            print(resultString)
        }
        return
    }
    for i in 0..<N {
        if !visited[i] {
            visited[i] = true
            result.append(String(number[i]))
            dfs(depth + 1)
            visited[i] = false
            result.removeLast()
        }
    }
}
dfs(0)
