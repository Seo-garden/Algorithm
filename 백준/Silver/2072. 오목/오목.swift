import Foundation

let n = Int(readLine()!)!

if n < 9 {
    print("-1")
    exit(0)
}

var board = Array(repeating: Array(repeating: 0, count: 20), count: 20)
let dr = [0, 0, -1, 1, -1, 1, -1, 1]
let dc = [1, -1, 0, 0, -1, 1, 1, -1]

private func is5mok(_ arr: [[Int]], _ r: Int, _ c: Int, _ color: Int) -> Bool {
    var count = [1, 1, 1, 1]
    for d in 0..<8 {
        var nr = r + dr[d]
        var nc = c + dc[d]
        while (0..<20).contains(nr), (0..<20).contains(nc), arr[nr][nc] == color {
            count[d / 2] += 1
            nr += dr[d]
            nc += dc[d]
        }
    }
    
    for i in 0..<4 {
        if count[i] == 5 {
            return true
        }
    }
    return false
}

for i in 0..<8 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0], b = input[1]
    board[a][b] = i % 2 + 1
}

for i in 8..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0], b = input[1]
    board[a][b] = i % 2 + 1
    if is5mok(board, a, b, i % 2 + 1) {
        print(i + 1)
        exit(0)
    }
}
print("-1")