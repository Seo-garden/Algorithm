let N = Int(readLine()!)!

let inputA = readLine()!.split(separator: " ").compactMap { Int($0)! }.sorted(by: >)
let inputB = readLine()!.split(separator: " ").compactMap { Int($0)! }.sorted()
var result = 0

for i in 0..<N {
    result += inputA[i] * inputB[i]
}
print(result)