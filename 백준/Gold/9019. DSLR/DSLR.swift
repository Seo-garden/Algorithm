private func D(_ n: Int) -> Int { (n * 2) % 10000 }
private func S(_ n: Int) -> Int { n == 0 ? 9999 : n - 1 }
private func L(_ n: Int) -> Int { (n % 1000) * 10 + n / 1000 }
private func R(_ n: Int) -> Int { (n % 10) * 1000 + n / 10 }

let T = Int(readLine()!)!

for _ in 0..<T {
    var visited = Array(repeating: false, count: 10001)
    var queue: [(Int, String)] = []
    var index = 0
    
    let AB = readLine()!.split(separator: " ").map { Int($0)! }
    let (A, B) = (AB[0], AB[1])
    queue.append((A, ""))
    visited[A] = true
    
    while true {
        let select = queue[index]
        let start = select.0, end = B, result = select.1
        index += 1
        if start != end {
            let d = D(start)
            let s = S(start)
            let l = L(start)
            let r = R(start)
            
            if visited[d] == false {
                visited[d] = true
                queue.append((d, result + "D"))
            }
            if visited[s] == false {
                visited[s] = true
                queue.append((s, result + "S"))
            }
            if visited[l] == false {
                visited[l] = true
                queue.append((l, result + "L"))
            }
            if visited[r] == false {
                visited[r] = true
                queue.append((r, result + "R"))
            }
        } else {
            print(result)
            break
        }
    }
}