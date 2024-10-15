let N = Int(readLine()!)!

var A = [Int]()
var B = [Int]()

let inputA = readLine()!.split(separator: " ").compactMap { Int($0)! }
let inputB = readLine()!.split(separator: " ").compactMap { Int($0)! }
A.insert(contentsOf: inputA, at: 0)
B.insert(contentsOf: inputB, at: 0)
var result = 0
var inputAsort = inputA.sorted(by: <)
var inputBsort = inputB.sorted(by: >)

for i in 0..<N {
    result += inputAsort[i] * inputBsort[i]
}
print(result)