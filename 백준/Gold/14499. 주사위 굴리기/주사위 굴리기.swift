let nmxyk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nmxyk[0], m = nmxyk[1], k = nmxyk[4]
var ci = nmxyk[2], cj = nmxyk[3]

var map = [[Int]]()
var result = [Int]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(input)
}

let direction = readLine()!.split(separator: " ").map { Int($0)! }

var n1 = 0, n2 = 0, n3 = 0, n4 = 0, n5 = 0, n6 = 0      //초기 주사위 값
//동서북남
let di = [0, 0, 0, -1, 1]
let dj = [0, 1, -1, 0, 0]

for dr in direction {
    let ni = ci + di[dr]
    let nj = cj + dj[dr]
    
    if ni >= 0 && ni < n && nj >= 0 && nj < m {
        let t1 = n1, t2 = n2, t3 = n3, t4 = n4, t5 = n5, t6 = n6
        if dr == 1 {
            n1 = t3
            n3 = t6
            n6 = t4
            n4 = t1
        } else if dr == 2 {
            n1 = t4
            n4 = t6
            n6 = t3
            n3 = t1
        } else if dr == 3 {
            n1 = t5
            n5 = t6
            n6 = t2
            n2 = t1
        } else if dr == 4 {
            n1 = t2
            n2 = t6
            n6 = t5
            n5 = t1
        }
        
        if map[ni][nj] == 0 {
            map[ni][nj] = n6
        } else {
            n6 = map[ni][nj]
            map[ni][nj] = 0
        }
        result.append(n1)
        ci = ni
        cj = nj
    }
}

for i in result {
    print(i)
}