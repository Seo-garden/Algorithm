let n = readLine()!.split(separator: " ").map { Int($0)! }
let n1 = n[0], n2 = n[1]

var input1 = Array(readLine()!).reversed()
var input2 = Array(readLine()!)
let t = Int(readLine()!)!

var ants = input1 + input2
var group = Array(repeating: 0, count: n1) + Array(repeating: 1, count: n2)

for _ in 0..<t {
    var i = 0
    while i < ants.count - 1 {
        if group[i] == 0 && group[i+1] == 1 {
            ants.swapAt(i, i+1)
            group.swapAt(i, i+1)
            i += 2
        } else {
            i += 1
        }
    }
}

print(String(ants))